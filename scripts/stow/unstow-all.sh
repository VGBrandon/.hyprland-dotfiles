#!/bin/bash

echo "Desinstalando todos los dotfiles con stow..."

# Cambiar al directorio donde están los dotfiles
cd "$(dirname "$0")"/.. || exit

# Iterar sobre cada carpeta y deshacer los dotfiles
for folder in */; do
  echo "Deshaciendo dotfiles desde: $folder"
  stow --verbose --target="$HOME" --delete "$folder"
done

echo "Todos los dotfiles han sido desinstalados."
