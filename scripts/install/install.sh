#!/bin/bash

echo "Iniciando instalación..."

# Paso 1: Instalar paquetes oficiales
./packages/official.sh

# Paso 2: Instalar paquetes AUR
./packages/aur.sh

# Paso 3: Configurar dotfiles con stow
../stow/stow-all.sh

# Paso 4: Configuración post-instalación
./post-install.sh

echo "¡Instalación completada!"
