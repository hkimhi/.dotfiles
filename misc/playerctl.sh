#!/usr/bin/env bash
# inspiration: https://yarmo.eu/blog/playerctl-polybar/

# title max length
max_len=16

# separate font for play icon since it is a little larger
font_icons=5
font_play=6
font=7

status=$(playerctl status 2>/dev/null)


title_format="{{ trunc(title, $max_len) }}"  # need this separate to pass in $max_len
title="%{T$font}$(playerctl metadata --format "$title_format" 2> /dev/null)"
# title="${title/%…/...}" # replace ellipses from playerctl truncate with three periods

progress="%{T$font}$(playerctl metadata --format '{{ duration(position) }} / {{ duration(mpris:length) }}' 2> /dev/null)"

icon_prev="%{T$font_icons}%{A1:playerctl previous:}%{A}%{T-}"
icon_next="%{T$font_icons}%{A1:playerctl next:}%{A}%{T-}"

if [[ $status =~ "Playing" ]]; then
	icon_action="%{T$font_icons}%{A1:playerctl pause:}%{A}%{T-}"
else
	icon_action="%{T$font_play}%{A1:playerctl play:}%{A}%{T-}"
fi

format_str="$icon_prev $icon_action $icon_next $title ($progress)"
if [[ $status == "" ]]; then
	echo ""
else
	echo "%{F#FFFFFF}%{T$font} $format_str"
fi
