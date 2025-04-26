#!/bin/bash

# Evitar multiples cargas
[[ -n "$__LOGGER_LOADED" ]] && return
__LOGGER_LOADED=1

# Define colores y formato
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color
BOLD='\033[1m'
UNDERLINE='\033[4m'

# Define iconos (puedes cambiarlos por emojis o caracteres que prefieras)
ICON_INFO="ℹ"
ICON_SUCCESS="✓"
ICON_WARNING="⚠"
ICON_ERROR="✗"
ICON_QUESTION="?"
ICON_CONFIG="⚙"
ICON_INSTALL="↓"
ICON_UPDATE="↻"
ICON_CLEAN="♺"

# Funciones de logging
print_info() {
    echo -e "${BLUE}${ICON_INFO} ${1}${NC}"
}

print_success() {
    echo -e "${GREEN}${ICON_SUCCESS} ${1}${NC}"
}

print_warning() {
    echo -e "${YELLOW}${ICON_WARNING} ${1}${NC}"
}

print_error() {
    echo -e "${RED}${ICON_ERROR} ${1}${NC}"
}

print_question() {
    echo -e "${MAGENTA}${ICON_QUESTION} ${1}${NC}"
}

print_config() {
    echo -e "${CYAN}${ICON_CONFIG} ${1}${NC}"
}

print_install() {
    echo -e "${GREEN}${ICON_INSTALL} ${1}${NC}"
}

print_update() {
    echo -e "${BLUE}${ICON_UPDATE} ${1}${NC}"
}

print_clean() {
    echo -e "${GRAY}${ICON_CLEAN} ${1}${NC}"
}
print_header() {
    local title="$1"
    local color="${2:-$BLUE}"
    local padded="  $title  "
    local length=$(printf "%s" "$padded" | wc -m)

    echo -e "${BOLD}${color}"
    printf '╔'
    printf '═%.0s' $(seq 1 "$length")
    printf '╗\n'

    printf '║%s║\n' "$padded"

    printf '╚'
    printf '═%.0s' $(seq 1 "$length")
    printf '╝\n' "${NC}"
}
# Función para confirmación de usuario
ask_confirmation() {
    log_question "${1} (y/n)"
    read -r response
    case "$response" in
    [yY][eE][sS] | [yY])
        return 0
        ;;
    *)
        return 1
        ;;
    esac
}
