#!/bin/bash

# Cargar logger
source "$(dirname "${BASH_SOURCE[0]}")/logger.sh"

# Función de actualización del sistema
update_system() {
    print_header "Actualizando el sistema..."

    # Actualizar con Pacman
    print_info "Actualizando paquetes de Pacman..."
    sudo pacman -Syu --noconfirm && print_success "Paquetes de Pacman actualizados correctamente." || print_error "Error al actualizar los paquetes de Pacman."

    # Actualizar con AUR
    print_info "Actualizando paquetes de AUR..."
    paru -Syu --noconfirm && print_success "Paquetes de AUR actualizados correctamente." || print_error "Error al actualizar los paquetes de AUR."

    print_success "Actualización del sistema completada."
}

# Ejecutar la función de actualización
update_system
