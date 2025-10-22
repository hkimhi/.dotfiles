#!/usr/bin/env bash

#terminate existing instances
polybar-msg cmd quit
# killall -q polybar

# launch polybar on all monitors
if type "xrandr" > /dev/null 2>&1; then
	xrandr --query | grep " connected" | while IFS=$"\n" read line; do
		# get monitor name
		monitor=$(echo $line | cut -d" " -f1)
		# check if primary. if not primary, $primary will be empty
		primary=$(echo $line | grep "primary")

		# if $primary defined, substitue '-systray'
		MONITOR=$monitor polybar --reload "bar1${primary:+"-systray"}" 2>&1 | tee -a /tmp/polybar_"$m".log & disown
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
