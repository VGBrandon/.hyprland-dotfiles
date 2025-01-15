#!/bin/bash

echo "Instalando paquetes AUR..."

# Verificar si yay está instalado
if ! command -v yay &> /dev/null; then
  echo "yay no está instalado. Instalándolo primero..."
  git clone https://aur.archlinux.org/yay.git
  cd yay || exit
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
  echo "yay instalado correctamente."
fi

# Instalar paquetes desde AUR

yay -S --needed --noconfirm \
  visual-studio-code-bin \
  google-chrome \
  wezterm-git

echo "Paquetes AUR instalados."

