#!/bin/bash

# Importar las funciones de logger
source "$(dirname "${BASH_SOURCE[0]}")/scripts/logger.sh"

print_header "Iniciando configuración de Hyprland"
source "$(dirname "${BASH_SOURCE[0]}")/scripts/system-update.sh"

print_header "Instalacion de paquetes"
source "$(dirname "${BASH_SOURCE[0]}")/scripts/install-pacman-pkgs.sh"
source "$(dirname "${BASH_SOURCE[0]}")/scripts/install-aur-pkgs.sh"

print_header "Creando Symlinks de los Dotfiles"
source "$(dirname "${BASH_SOURCE[0]}")/scripts/symlink.sh"
