#!/usr/bin/env bash

#terminate existing instances
polybar-msg cmd quit
# killall -q polybar

# launch polybar on all monitors
if type "xrandr" > /dev/null 2>&1; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1 | tac); do
		MONITOR=$m polybar --reload 2>&1 | tee -a /tmp/polybar_"$m".log & disown
	done
else
	# single monitor fallback if can't find xrandr or something
	polybar 2>&1 | tee -a /tmp/polybar.log & disown
fi

# wait until IPC is ready
while [ -z "$(ls /tmp/polybar_mqueue.* 2>/dev/null)" ]; do
	sleep 0.1
done

# hide "battery gap" module for consistent spacing on desktop with ipc
if ! ls /sys/class/power_supply/BAT* > /dev/null 2>&1; then
	polybar-msg action gap-battery module_hide
fi

echo "Polybar(s) launched..."
