#!/bin/bash

# Archivo para guardar el estado
STATE_FILE="$HOME/.config/hyprshade/blue_light_filter.state"

# Crear el archivo de estado si no existe
if [[ ! -f $STATE_FILE ]]; then
    echo "off" >"$STATE_FILE"
fi

# Leer el estado actual
STATE=$(<"$STATE_FILE")

# Si el script se ejecuta sin argumentos (inicio automático), activar si el estado es "on"
if [[ -z $1 && $STATE == "on" ]]; then
    hyprshade on blue-light-filter-w11
fi

# Alternar estado solo si se ejecuta con un clic
if [[ $1 == "toggle" ]]; then
    if [[ $STATE == "off" ]]; then
        echo "on" >"$STATE_FILE"
        STATE="on"
        hyprshade on blue-light-filter-w11
    else
        echo "off" >"$STATE_FILE"
        STATE="off"
        hyprshade toggle
    fi
fi

# Asignar ícono basado en el estado actual
if [[ $STATE == "on" ]]; then
    ICON="󰔡" # Ícono para activado
else
    ICON="󰔢" # Ícono para desactivado
fi

# Salida para Waybar
echo -e "{\"text\": \"$ICON\", \"tooltip\": \"Blue Light Filter: $STATE\"}"
