#!/bin/bash

# Archivo para guardar el estado
STATE_FILE="$HOME/.config/hyprshade/blue_light_filter.state"

# Crear el archivo si no existe
[[ ! -f $STATE_FILE ]] && echo "off" >"$STATE_FILE"

# Leer el estado actual
STATE=$(<"$STATE_FILE")

toggle_filter() {
    if [[ $STATE == "off" ]]; then
        echo "on" >"$STATE_FILE"
        hyprshade on blue-light-filter-w11
    else
        echo "off" >"$STATE_FILE"
        hyprshade toggle
    fi
}

# Si el script se ejecuta sin argumentos, activar si el estado es "on"
if [[ -z $1 && $STATE == "on" ]]; then
    hyprshade on blue-light-filter-w11
fi

# Alternar estado si se ejecuta con "toggle"
[[ $1 == "toggle" ]] && toggle_filter

# Determinar el ícono
ICON="󰔢" # Ícono desactivado por defecto
[[ $(<"$STATE_FILE") == "on" ]] && ICON="󰔡"

# Salida para Waybar
echo -e "{\"text\": \"$ICON\", \"tooltip\": \"Blue Light Filter: $(<"$STATE_FILE")\"}"
