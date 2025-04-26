#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/logger.sh"

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
# Ruta al archivo de paquetes
PKG_FILE="$SCRIPT_DIR/../packages/pacman-pkgs.txt"

# Verificar que exista
if [[ ! -f "$PKG_FILE" ]]; then
    print_warning "No se encontró el archivo de paquetes: $PKG_FILE"
    exit 1
fi

print_header "Instalando paquetes de pacman"

# Filtrar líneas válidas (sin comentarios ni vacías)
readarray -t packages < <(grep -Ev '^\s*#|^\s*$' "$PKG_FILE" | sed 's/^\s*//;s/\s*$//')

if [[ ${#packages[@]} -eq 0 ]]; then
    print_info "No hay paquetes para instalar en $PKG_FILE"
    exit 0
fi

print_info "Instalando paquetes de pacman..."
sudo pacman -S --noconfirm --needed "${packages[@]}" &&
    print_success "Todos los paquetes se instalaron correctamente." ||
    print_warning "Hubo un error al instalar los paquetes."
