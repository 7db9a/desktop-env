#!/bin/bash

# DON"T EXCUTE THIS SCRIPT.

# Follow README's install and setup instructions: archfi and LARBS.
# Below is only after a minimum desktop environment has been created.

# Submodule of fzf. It'll override LARBS fzf settings, if I'm not mistaken.
# If not installed Ctr + R and Ctr + T won't work.
git submodule update -- .fzf/install
./fzf/install

# Install Nix
# nixos.org/downloads.html#nix-quick-install
curl -L https://nixos.org/nix/install | sh
# Otherwise nix-env and others will appear not to be on the system.
source $HOME/.nix-profile/etc/profile.d/nix.sh

# Install xbindkeys
nix-env iA nixpkgs.xbindkeys

# Specificully used to convert markdown to html (an nmgr dependency).
nix-env -iA nixpkgs.pandoc

# Used as a nmgr dependency
nix-env -iA nixpkgs.ripgrep

# Update arch system.
pacman -Syu

# Install ntpd to keep clock in sync.
pacman -Syu ntp

# Enable it at boot and clock sync at boot.
systemctl enable ntpd.service

# May require a computer reboot for clock to sync, but launch it right away.
systemctl start ntpd.service

# Install docker (kind of complicated with non-nixos nix).
pacman -Syu docker

systemctl enable docker.service

systemctl start docker.service

# nix's docker-compose works.
nix-env -iA nixpkgs.docker-compose

# Install xrandr for display management (replace with nix pkg?)
pacman -S xorg-xrandr

# Has xargs, which is needed for nmgr.
pacman -S findutils

# Firewall
pacman -S ufw
# May have to reboot.
ufw enable

# Allows ratelimited ssh (something like 6 per 30 seconds).
ufw limit ssh

# Install openssh

pacman -S openssh

# Start sshd on boot also start right away.
systemctl enable sshd.service
systemctl start sshd.service

## See Openssh note on creating password and passphrase free ssh login.

# Install wget
pacman -S wget

# Install cargo (nix's cargo can't compile hal crate). I chose default install option when prompted

curl https://sh.rustup.rs -sSf | sh

# Install bitcoin cli tool, hal.

cargo install hal

# Install shunit2 for bash unit tests.

nix-env -iA nixpkgs.shunit2

# Symlink individualized man page to where man can find it.
sudo ln -s $HOME/:w.local/i-man/man1/xbindkeys.1 /usr/local/share/man/man1/i-xbindkeys.1
