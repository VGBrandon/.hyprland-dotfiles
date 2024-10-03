#!/bin/bash

# Archivo de estado
STATE_FILE="$HOME/.config/hyprshade/state_file"  # Ajusta la ruta según corresponda

# Leer el estado actual
if [ -f "$STATE_FILE" ]; then
    source "$STATE_FILE"
else
    echo "El archivo de estado no existe."
    exit 1
fi

# Verificar si el filtro está activo
if [ "$actived" = "true" ]; then
    # Desactivar el filtro
    hyprshade off
    echo "Filtro de luz azul desactivado."
    # Actualizar el estado
    echo "actived=false" > "$STATE_FILE"
else
    # Activar el filtro
    hyprshade on blue-light-filter
    echo "Filtro de luz azul activado."
    # Actualizar el estado
    echo "actived=true" > "$STATE_FILE"
fi
