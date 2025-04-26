#!/bin/bash

# Directorio donde tienes tus dotfiles organizados
DOTFILES_DIR="$HOME/.hyprland-dotfiles"

echo "Buscando conflictos..."

# Recorre todos los archivos en el directorio de dotfiles
find "$DOTFILES_DIR" -type f | while read -r FILE; do
    # Construye la ruta de destino correspondiente
    TARGET="$HOME/${FILE#$DOTFILES_DIR/}"

    # Verifica si el destino existe Y no es un symlink
    if [ -e "$TARGET" ] && [ ! -L "$TARGET" ]; then
        mv "$TARGET" "$TARGET.bak"
        echo "Renombrado $TARGET -> $TARGET.bak"
    fi
done

echo "Aplicando stow..."

# Ejecuta stow en el directorio de dotfiles
cd "$DOTFILES_DIR" || exit 1
stow .

echo "¡Stow aplicado exitosamente!"

# Recarga Hyprland para que tome los cambios
echo "Recargando configuración de Hyprland..."
hyprctl reload

echo "Proceso completado."
