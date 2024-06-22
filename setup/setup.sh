#!/usr/bin/env bash

cd "$(dirname "$0")" || exit 1

# Install packages from official repositories
xargs sudo pacman -Syu <pacman.txt

# Install AUR helper
git clone https://aur.archlinux.org/yay-bin.git
(
    cd yay-bin || exit 1
    makepkg -sicr yay-bin
)
rm -rf yay-bin

# Install AUR packages
xargs yay -S <aur.txt

# Change shell for user and root to Zsh
sudo chsh -s /usr/bin/zsh
sudo chsh -s /usr/bin/zsh root

# Stow dotfiles without making directory symlinks
(
    cd ..
    fd -utd --base-directory home | xargs -I {} mkdir -vp ~/{}
    stow -t ~ home
)
