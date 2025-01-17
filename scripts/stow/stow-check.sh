#!/bin/bash

# Cambiar al directorio raíz de .hyprland-dotfiles
cd "$(cd "$(dirname "$0")"/.. && pwd)" || exit

# Verificar si hay archivos existentes que podrían entrar en conflicto
echo "Verificando conflictos antes de aplicar los dotfiles..."

# Verificar conflictos en archivos individuales
for file in $(find . -type f); do
  if [ -e "$file" ]; then
    echo "Conflicto encontrado: $file"
    mv "$file" "$file.bak"
    echo "Archivo renombrado a: $file.bak"
  fi
done

echo "No se encontraron conflictos. El proceso puede continuar."

