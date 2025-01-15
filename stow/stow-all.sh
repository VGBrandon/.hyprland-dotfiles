#!/bin/bash

# Cambiar al directorio raíz de .hyprland-dotfiles
cd "$(cd "$(dirname "$0")"/.. && pwd)" || exit

# Verificar conflictos antes de aplicar los dotfiles
./stow/stow-check.sh

# Aplicar todos los dotfiles usando stow para carpetas
echo "Aplicando carpetas de dotfiles..."
stow -v --dir=. stow/

# Aplicar archivos individuales de dotfiles, como .zshrc, etc.
echo "Aplicando archivos individuales..."
stow -v --no-folding --dir=. zsh

echo "¡Dotfiles aplicados exitosamente!"
