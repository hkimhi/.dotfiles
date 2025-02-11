#!/usr/bin/env bash

#terminate existing instances
polybar-msg cmd quit
# killall -q polybar

polybar 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched..."
