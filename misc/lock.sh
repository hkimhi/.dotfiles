#!/usr/bin/env bash

time_format="%H:%M"
# time_pos="960+w:300"
time_pos="960+ix:300"
date_format="(%A) %b %d, %Y"
# indicator_pos="60+w:h-60"
indicator_pos="60:h-60"
image="/home/hod/Pictures/wallpapers/rocket-league-light.png"
# image="/home/hod/Pictures/wallpapers/cypress-bowl-lookout.jpg"

# --no-verify \
i3lock \
	-Li "$image" \
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
	--date-size=20 \
	--verif-text="" \
	--wrong-text=""
