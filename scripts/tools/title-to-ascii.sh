#!/bin/bash

# Colores Gruvbox Material
GRUVBOX_BG='\033[48;5;234m'     # Background oscuro
GRUVBOX_RED='\033[38;5;203m'    # Rojo
GRUVBOX_GREEN='\033[38;5;108m'  # Verde
GRUVBOX_YELLOW='\033[38;5;220m' # Amarillo
GRUVBOX_BLUE='\033[38;5;117m'   # Azul
GRUVBOX_PURPLE='\033[38;5;127m' # Púrpura
GRUVBOX_AQUA='\033[38;5;111m'   # Aqua
GRUVBOX_GREY='\033[38;5;244m'   # Gris
NC='\033[0m'                    # Sin color

sudo pacman -S --needed --noconfirm figlet &>/dev/null

# Función para convertir texto a ASCII con colores
title_to_ascii() {
    local texto="$1"
    local color="$2"

    # Determinar el color
    case "$color" in
    bg) color_code=$GRUVBOX_BG ;;
    red) color_code=$GRUVBOX_RED ;;
    green) color_code=$GRUVBOX_GREEN ;;
    yellow) color_code=$GRUVBOX_YELLOW ;;
    blue) color_code=$GRUVBOX_BLUE ;;
    purple) color_code=$GRUVBOX_PURPLE ;;
    aqua) color_code=$GRUVBOX_AQUA ;;
    grey) color_code=$GRUVBOX_GREY ;;
    *) color_code=$NC ;; # Si el color no es reconocido, se usa sin color
    esac

    # Generar el texto ASCII con figlet y aplicar color
    figlet -f slant "$texto" | while IFS= read -r line; do
        echo -e "${color_code}$line${NC}"
    done
}

# Si este script se ejecuta directamente, solicita texto y color
#if [ -z "$1" ] || [ -z "$2" ]; then
#    echo "Uso: $0 <texto> <color>"
#    echo "Colores disponibles: bg, red, green, yellow, blue, purple, aqua, grey"
#    exit 1
#fi

# Llamar a la función con los argumentos proporcionados
#convertir_a_ascii "$1" "$2"
