#!/bin/bash

echo "Instalando paquetes oficiales..."

sudo pacman -S --needed --noconfirm \
  zsh \
  git \
  stow \
  starship \
  lazygit \
  eza \
  neofetch

echo "Paquetes oficiales instalados."

