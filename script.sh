#!/bin/bash

# DON"T EXCUTE THIS SCRIPT.

# Install Nix
# nixos.org/downloads.html#nix-quick-install
curl -L https://nixos.org/nix/install | sh
# Otherwise nix-env and others will appear not to be on the system.
source $HOME/.nix-profile/etc/profile.d/nix.sh

# Install xbindkeys
nix-env iA nixpkgs.xbindkeys

# Symlink individualized man page to where man can find it.
sudo ln -s $HOME/:w.local/i-man/man1/xbindkeys.1 /usr/local/share/man/man1/i-xbindkeys.1
