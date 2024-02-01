#!/usr/bin/zsh

#Remove orphaned libraries
pamac remove --orphans
#clean cache
pamac clean --build-files
# Clean kioexec cache
rm --recursive ~/.cache/kioexec/krun/*

pacman -Sc
pacman -Qdt
pacman -Rns $(pacman -Qtdq)

# Vacuum journals
journalctl --vacuum-size=50M && journalctl --vacuum-time=2d

# Remove all uninstalled packages
paccache -rvuk0

# Remove old installed packages, leave 3
paccache -rvk3

# Clean pamac build cache
pamac clean -bv

# Clean temporary build files
rm -rf ~/{.bundle,.cargo,.cmake,.dotnet,.electron,.electron-gyp,.gem,.gradle,.lazarus,.node-gyp,.npm,.nuget,.nvm,.racket,.rustup,.stack,.yarn} || true

rm -rf ~/go || true
