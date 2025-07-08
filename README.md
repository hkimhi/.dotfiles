Required tooling:

* GNU Stow


# Neovim setup dependencies

* image.nvim: `luajit`, `libmagickwand-dev`


# TODO

* get a cleaner install setup
    * [dotbot](https://github.com/anishathalye/dotbot) looks interesting
    * chezmoi definitely looks like too much
    * maybe [custom makefile](https://github.com/jmervine/zshrc/blob/master/Makefile)? can add different targets, clean / uninstall, test, automate more than just symlinkling ~/.`config` (like adding targets for `lock.sh` in `/usr/local/bin` and the various other things in `misc/`)
    * thinking of going away from stow anyways
    * [useful link](https://dev.to/lostintangent/how-do-you-manage-and-synchronize-your-dotfiles-across-multiple-machines-2n24)

* update dependencies
    * maim
    * i3lock (on desna)
    * betterlockscreen (on erecura)

* update / automate installation of dependencies (currently only have `__setup/debian.sh`)
