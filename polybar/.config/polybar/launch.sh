#!/usr/bin/env bash

#terminate existing instances
polybar-msg cmd quit
# killall -q polybar

# launch polybar on all monitors
if type "xrandr" > /dev/null 2>&1; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload 2>&1 | tee -a /tmp/polybar_"$m".log & disown
	done
else
	# single monitor fallback if can't find xrandr or something
	polybar 2>&1 | tee -a /tmp/polybar.log & disown
fi

echo "Polybar(s) launched..."
