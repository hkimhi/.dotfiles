#!/usr/bin/env bash
# source: https://dev.to/spacerockmedia/how-i-manage-my-dotfiles-using-gnu-stow-4l59

## update submodules
# git submodule init
# git submodule update

# dierctories to be installed by all users (including root)
base=(
	bash
)

# directories to be installed only by local user
useronly=(
	git
	nvim
	kitty
)

# run stow command
stowit() {
	usr=$1
	app=$2
	# -v verbose
	# -R restow
	# -t target
	stow -v -R -t ${usr} ${app}
}

echo ""
echo "Stowing apps for user: ${whoami}"

# install apps (local user and root)
for app in ${base[@]}; do
	stowit "${HOME}" $app
done

# install apps (local user)
for app in ${useronly[@]}; do
	if [[ ! "$(whoami)" = *"root"* ]]; then
		stowit "${HOME}" $app
	fi
done

echo ""
echo "#### ALL DONE"
