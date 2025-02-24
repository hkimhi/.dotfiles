#!/usr/bin/env bash

time_format="%H:%M"
time_pos="960:300"
date_format="(%A) %b %d, %Y"
indicator_pos="60:h-60"

# --no-verify \
i3lock \
	-Li ~/Pictures/wallpapers/rocket-league-light.png \
	-k \
	--indicator \
	--radius 30 \
	--ring-width=10 \
	--inside-color=00000000 \
	--ring-color=FFFFFFFF \
	--line-color=00000000 \
	--ind-pos="$indicator_pos" \
	--time-str="$time_format" \
	--time-pos="$time_pos" \
	--time-color=FFFFFFFF \
	--timeoutline-color=000000FF \
	--time-font=sans-serif:style=Bold \
	--timeoutline-width=1 \
	--time-size=80 \
	--date-str="$date_format" \
	--date-size=20
