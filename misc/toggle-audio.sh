#!/usr/bin/env bash

curr_device=$(pactl list sinks | grep "Active Port" | gawk -F: '{print $2}' | tr -d '[:space:]')
sink=$(pactl info | grep "Default Sink" | cut -d ' ' -f3)

if [[ "$curr_device" == "analog-output-headphones" ]]; then
	new_device="analog-output-lineout"
else
	new_device="analog-output-headphones"
fi

pactl set-sink-port "$sink" "$new_device"
