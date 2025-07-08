#!/usr/bin/env bash

THEME_FILE="$HOME/.theme_state"

# read current theme
if [[ -f "$THEME_FILE" ]]; then
	theme=$(cat "$THEME_FILE")
else
	theme="dark"
fi

# toggle the theme
if [[ "$theme" == "dark" ]]; then
	new_theme="light"
else
	new_theme="dark"
fi

# save new theme
echo "$new_theme" > "$THEME_FILE"


# do stuff
kitty_theme_light="1984 light"
kitty_theme_dark="dracula"

case "$new_theme" in
	"light")
		# set background
		# feh --bg-scale "./rocket-league-light.png"
		feh --bg-scale ~/Pictures/wallpapers/rocket-league-light.png

		# set kitty terminal emulator theme
		kitten theme --reload-in=all "$kitty_theme_light"
		exit 0;
		;;

	"dark")
		# set background
		# feh --bg-scale "./rocket-league-dark.jpg"
		feh --bg-scale ~/Pictures/wallpapers/rocket-league-dark.jpg

		# set kitty terminal emulator theme
		kitten theme --reload-in=all "$kitty_theme_dark"
		exit 0;
		;;

	*)
		echo "invalid theme selected!"
		exit 1;
		;;
esac

exit 0;
