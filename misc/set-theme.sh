#!/usr/bin/env bash

case $1 in
	"light")
		echo "light activated";
		feh --bg-scale ~/Pictures/wallpapers/rocket-league-light.png
		exit 0;
		;;
	
	"dark")
		echo "dark activated";
		feh --bg-scale ~/Pictures/wallpapers/rocket-league-dark.jpg
		exit 0;
		;;
	
	*)
		echo "invalid theme selected!"
		exit 1;
		;;
esac

exit 0;
