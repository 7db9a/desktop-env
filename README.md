# Desktop Environment


The archlinux install was done using archfi. Configs and scripts are versioned from $HOME in the Voidrice working tree. This README is versioned in work/desktop-env's working tree.


**Goals**

Nix's package manager, add as much of new software with.

**Todo**

- [ ] Move all modified and added files to Voidrice outside of working tree. That way I can stay downstream without breaking anything or drop in a replacement to Voidrice. Perhaps do all that in `work/desktop-env`.

- [ ] Move off of Github.

I forked LARBS and Voidrice so that I could keep all the computers on the same page.

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

Increase/decrease size of window `Super + l`/`Super + h `.

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

## Arch Install and Setup

### Install Script - MatMoul

Run script per instructions from:
[My forked archfi installer](https://github.com/7db9a/personal_archfi)


Check if you have EFI or UEFI

`ls /sys/firmware/efi`

Menus guide:

* Language: English (By MatMoul)
* Set Keyboard Layout: us
* Disk Partitions: Auto Partitions (gpt, efi)
   * Only if your have efi (see below to check)
   * Select the hard drive - probably /dev/sda.
   * After completing ("yes" and "yes"), go back to Main Menu.
* Select Partitions and Install
    * devices 'Okeyed' in order pre=selected. Home should pre=select to None.
* Format Device
    * boot should be fat32 (EFI), unless you don't have EFI.
    * swap - just okay it.
    * root - I do btrfs (MatMoul video selected that and my research supports that decision)
* Mount Install and Config
* Install Arch Linuxpacstrap
  * Kernel: linux
  * Linux firmware: pre-selected packages

* Config Arch Linux
* Set Computer Name (this is root and not your other user that will be setup later)
* Keyboard layout: us
* Set Locale: en_US
* Set Time: US > Eastern > UTC
* Generate fstab: UUID genfstab -U
* Bootlaoder: grub > "Install pacstrap grup (ef ibootmgr), grub-mkconfig" > "efi bootmgr is required for efi computer": ***select if true.***
* Install bootloader grub-install > Select drive > EFI (if true)
Places back in Grub Install Menu. Go back to levels to  Arch Install Menu.
* Extras
   * Deselect nano and vim (spacebar) and keep dhcpd
Places back in Grub Install Menu. Go back 2 levels to Install Menu.
* Config Arch Linux > Unmount
Places into Format and Mount menu. Go back to Main Menu.
* Reboot
[Watch video: Arch Linux installer (archfi) : Base and Grub Install Script - EFI,UEFI](https://www.youtube.com/watch?v=FMSeLZkZq6A&list=PLytHgIKLV1caHlCrcTSkm5OF2WSVI1_Sq&index=2&ab_channel=MatMoul)

### Desktop setup script - Luke Smith

Update system and refresh Arch keyrings (package developer signatures):

`pacman -Syu && pacman-key --refresh-keys`

LARBS may be broken so use older larbs.sh version I forked and modified.

```
curl -LO raw.githubusercontent.com/7db9a/personal_LARBS/master/larbs.sh
sh larbs.sh
```

## Other info
Downgrade a package and downgrade packages to a specific date:

[https://wiki.archlinux.org/index.php/Arch\_Linux\_Archive#How\_to\_restore\_all\_packages\_to\_a\_specific\_date](https://wiki.archlinux.org/index.php/Arch_Linux_Archive#How_to_restore_all_packages_to_a_specific_date)

https://www.rdeeson.com/weblog/176/how-to-rollback-a-system-update-on-arch-linux
