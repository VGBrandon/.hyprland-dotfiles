#!/bin/bash

echo "Instalando paquetes oficiales..."

sudo pacman -S --needed --noconfirm \
    zsh \
    git \
    stow \
    starship \
    lazygit \
    eza \
    neofetch \
    nodejs \
    npm \
    unzip \
    hyprlock \
    yazi \
    neovim \
    tree

echo "Paquetes oficiales instalados."
