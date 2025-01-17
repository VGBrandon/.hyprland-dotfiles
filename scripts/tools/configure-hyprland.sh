#!/bin/bash

HYPRLAND_SOURCE="$HOME/.hyprland-dotfiles/.config/hypr/hyprland.conf"
HYPRLAND_DEST="$HOME/.config/hypr/hyprland.conf"

# Manejar hyprland.conf manualmente
handle_hyprland_conf() {
    echo "Manejando hyprland.conf manualmente..."

    # Reemplazar el contenido del archivo destino con el del archivo fuente
    cat "$HYPRLAND_SOURCE" >"$HYPRLAND_DEST"
    echo "Se reemplazó el contenido de $HYPRLAND_DEST con el contenido de $HYPRLAND_SOURCE."
}

handle_hyprland_conf
