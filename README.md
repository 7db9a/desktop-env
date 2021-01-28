# Desktop Environment

The archlinux install was done using archfi. Configs and scripts are versioned from $HOME in the Voidrice working tree. This README is versioned in work/desktop-env's working tree.

Excuse some of the yodaisms: easier to parse with my eyes.

**Goals**

Nix's package manager, add as much of new software with.

**Todo**

- [ ] Move all modified and added files to Voidrice outside of working tree. That way I can stay downstream without breaking anything or drop in a replacement to Voidrice. Perhaps do all that in `work/desktop-env`.

- [ ] Move off of Github.


## Useful LARBS and Voidrice info

Luke Smith's Auto-Ricing Bootstrapping Scripts is used as the basis for the desktop environmnent. It installs Voidrice dotfiles.

LARBS guide `Super + F1`. Shows basic info and key-bindings to as a reminder.

It's versioned controlled in $HOME. Add and modify configs and scripts in the Voidrice working tree.

Get LARB's help with `Super + f1`.

**file manager: lf**

Toggle show hidden files `zh`. Quite `q`.

**window manager**

Toggle windows `Super + j`.

Toggle status bar `Super + b`.

Increase/decrease size of window `Super + l`/`Super + h	`.

Toggle color in zathura (pdf reader) `i`.

**vi mode shell**

Enter normal mode with `Esc`, then do move around as if in `vi`.

## Setup

Used archfi as a gui installer for Arch. Used LARBS for minimal desktop environment.

### Package additions after setup.

Used to manage monitors.

* xorg-xrandr (pacman)

* xbindkeys (nix)

### Script additions after setup.

`texm` is a script to toggle external monitor.

`work/script.sh` is going to automate this setup.

* ~/.local/bin/texm (voidrice working tree)

## How To

### Add Custom Manpage (i-man)

We call individualized man pages like others.

* Add man page file to `~/.local/i-man/man1/`. `man1` means it's for  a general program. See files in the directory as an example for syntax.

* Then symlink the file to man's path at`/usr/local/man/man1`.

* To the git working tree, add the new file found in `~/.local/i-man/man1/`.


https:://www.cyberciti.biz/faq/linux-unix-creating-a-manpage
