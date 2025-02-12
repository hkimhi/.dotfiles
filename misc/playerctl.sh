#!/usr/bin/env bash
# inspiration: https://yarmo.eu/blog/playerctl-polybar/

# title max length
max_len=24

# separate font for play icon since it is a little larger
font_icons=5
font_play=6
font=7

playerctlstatus=$(playerctl status 2>/dev/null)


title_format="{{ trunc(title, $max_len) }}"  # need this separate to pass in $max_len
title="%{T$font}$(playerctl metadata --format "$title_format" )"
# title="${title/%…/...}" # replace ellipses from playerctl truncate with three periods

prev="%{T$font_icons}%{A1:playerctl previous:}%{A}%{T-}"
next="%{T$font_icons}%{A1:playerctl next:}%{A}%{T-}"
progress="%{T$font}$(playerctl metadata --format '{{ duration(position) }} / {{ duration(mpris:length) }}' 2> /dev/null)"

if [[ $playerctlstatus =~ "Playing" ]]; then
	action="%{T$font_icons}%{A1:playerctl pause:}%{A}%{T-}"
else
	action="%{T$font_play}%{A1:playerctl play:}%{A}%{T-}"
fi

format_str="$prev $iaction $inext $title ($progress)"
if [[ $playerctlstatus == "" ]]; then
	echo ""
else
	echo "%{F#FFFFFF}%{T$font} $format_str"
fi
