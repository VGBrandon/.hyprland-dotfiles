#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/logger.sh"

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
# Ruta al archivo de paquetes
AUR_HELPER="paru"
AUR_PKG_FILE="$SCRIPT_DIR/../packages/aur-pkgs.txt"
# Ícono representativo de AUR
AUR_ICON="🚀"

# Verifica si el helper de AUR está instalado
if ! command -v "$AUR_HELPER" &>/dev/null; then
    print_warn "$AUR_ICON AUR helper '$AUR_HELPER' no está instalado."
    read -p "¿Deseas instalar '$AUR_HELPER'? [s/N]: " confirm
    if [[ "$confirm" =~ ^[sS]$ ]]; then
        print_info "$AUR_ICON Instalando $AUR_HELPER..."
        git clone https://aur.archlinux.org/"$AUR_HELPER".git
        pushd "$AUR_HELPER" || exit 1
        makepkg -si --noconfirm
        popd
        rm -rf "$AUR_HELPER"
    else
        print_error "Instalación cancelada. No se puede continuar sin '$AUR_HELPER'."
        exit 1
    fi
fi

# Verificar que exista
if [[ ! -f "$AUR_PKG_FILE" ]]; then
    print_warning "No se encontró el archivo de paquetes: $AUR_PKG_FILE"
    exit 1
fi

print_header "Instalando paquetes de AUR"

# Filtrar líneas válidas (sin comentarios ni vacías)
readarray -t packages < <(grep -Ev '^\s*#|^\s*$' "$AUR_PKG_FILE" | sed 's/^\s*//;s/\s*$//')
if [[ ${#packages[@]} -eq 0 ]]; then
    print_info "No hay paquetes para instalar en $AUR_PKG_FILE"
    exit 0
fi

print_info "Instalando paquetes de AUR..."
$AUR_HELPER -S --noconfirm --needed "${packages[@]}" &&
    print_success "Todos los paquetes se instalaron correctamente." ||
    print_warning "Hubo un error al instalar los paquetes."
echo
