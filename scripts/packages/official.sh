#!/bin/bash

echo "Instalando paquetes oficiales..."

sudo pacman -S --needed --noconfirm \
  zsh \
  git \
  stow \
  starship \
  lazygit

echo "Paquetes oficiales instalados."

