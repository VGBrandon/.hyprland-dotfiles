#!/bin/bash

# Ruta del archivo de estado
STATE_FILE="$HOME/.config/hyprshade/state"

# Leer el estado actual
source "$STATE_FILE"

# Alternar el estado
if [ "$actived" = "false" ]; then
    hyprshade on blue-light-filter
    echo "actived=true" > "$STATE_FILE"
else
    hyprshade off
    echo "actived=false" > "$STATE_FILE"
fi
