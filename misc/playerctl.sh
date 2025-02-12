#!/usr/bin/env bash
# inspiration: https://yarmo.eu/blog/playerctl-polybar/

# title max length
max_len=24

# separate font for play icon since it is a little larger
font_icons=5
font_play=6
font=7

playerctlstatus=$(playerctl status 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)
if [[ ${#title} -gt $max_len ]]; then
	title="${title:0:$max_len}..."
fi
title="%{T$font}$title"

prev="%{T$font_icons}%{A1:playerctl previous:}%{A}%{T-}"
next="%{T$font_icons}%{A1:playerctl next:}%{A}%{T-}"

if [[ $playerctlstatus =~ "Playing" ]]; then
	action="%{T$font_icons}%{A1:playerctl pause:}%{A}%{T-}"
else
	action="%{T$font_play}%{A1:playerctl play:}%{A}%{T-}"
fi

format_str="$prev $action $next $title"
if [[ $playerctlstatus == "" ]]; then
	echo ""
else
	echo "%{F#FFFFFF}%{T$font} $format_str"
fi
