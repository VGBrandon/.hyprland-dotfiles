#!/bin/bash

# Cambiar a zsh solo si no estás usando zsh
[[ "$SHELL" != *"zsh"* ]] && chsh -s $(which zsh) && echo "Shell cambiado a zsh. Cierra y abre de nuevo tu sesión."

# Reemplazar contenido de hyprland.conf
$HOME/.hyprland-dotfiles/scripts/tools/configure-hyprland.sh

# Instalacion de pnpm
sudo npm install -g pnpm

# Instalacion de live-server
sudo npm install -g live-server

sudo $HOME/.hyprland-dotfiles/scripts/tools/configure-grub.sh
