#!/bin/bash

# Directorio donde tienes tus dotfiles organizados
DOTFILES_DIR=~/.dotfiles

# Recorre todos los archivos en el directorio de dotfiles
find "$DOTFILES_DIR" -type f | while read FILE; do
    # Construye la ruta de destino correspondiente
    TARGET="${HOME}/${FILE#$DOTFILES_DIR/}"

    # Si el archivo ya existe en la ruta de destino, renómbralo con .bak
    if [ -f "$TARGET" ]; then
        mv "$TARGET" "$TARGET.bak"
        echo "Renombrado $TARGET a $TARGET.bak"
    fi
done

# Finalmente, ejecuta stow en el directorio .dotfiles
cd "$DOTFILES_DIR"
stow .

echo "Stow aplicado exitosamente."

#Falta validar que los archivos renombrados no sean symlinks (accesos directos de stow)

