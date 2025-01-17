#!/bin/bash

# Verificar conflictos antes de aplicar los dotfiles
../tools/prepare-stow.sh

# Cambiar al directorio raíz de .hyprland-dotfiles
cd $HOME/.hyprland-dotfiles

# Aplicar todos los dotfiles usando stow para carpetas
echo "Aplicando carpetas de dotfiles..."
stow .

echo "¡Dotfiles aplicados exitosamente!"
