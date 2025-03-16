#!/bin/bash

# Carpeta donde están los fondos
WALLPAPER_DIR="$HOME/Pictures"
STATE_FILE="$HOME/.config/wallpaper.state"

# Crear archivo de estado si no existe
[[ ! -f $STATE_FILE ]] && echo "" >"$STATE_FILE"

# Obtener la lista de imágenes disponibles
WALLPAPERS=("$WALLPAPER_DIR"/*.{jpg,jpeg,png})
TOTAL=${#WALLPAPERS[@]}

# Función para cambiar el fondo
change_wallpaper() {
    # Obtener el índice actual
    CURRENT_WALLPAPER=$(<"$STATE_FILE")
    INDEX=0

    for i in "${!WALLPAPERS[@]}"; do
        if [[ "${WALLPAPERS[$i]}" == "$CURRENT_WALLPAPER" ]]; then
            INDEX=$(((i + 1) % TOTAL)) # Pasar al siguiente fondo en la lista
            break
        fi
    done

    # Nuevo fondo
    NEW_WALLPAPER="${WALLPAPERS[$INDEX]}"

    # Guardar el fondo actual
    echo "$NEW_WALLPAPER" >"$STATE_FILE"

    # Aplicar el fondo con swww
    swww img "$NEW_WALLPAPER" --transition-type=wipe
}

# Si se ejecuta sin argumentos, cargar el último fondo guardado
if [[ -z $1 ]]; then
    SAVED_WALLPAPER=$(<"$STATE_FILE")
    [[ -n "$SAVED_WALLPAPER" ]] && swww img "$SAVED_WALLPAPER"
    echo -e "{\"text\": \"$ICON\", \"tooltip\": \"Cambiar fondo\"}"
    exit 0
fi

# Si se ejecuta con "toggle", cambiar el fondo
if [[ $1 == "toggle" ]]; then
    change_wallpaper
fi

# Ícono para Waybar
ICON="󰏘" # Puedes cambiarlo por otro si quieres
echo -e "{\"text\": \"$ICON\", \"tooltip\": \"Cambiar fondo\"}"

# Cosas a mejorar:
# - No esta cargando el tooltip correctamente
# - el icono esta cortado
# - arreglar los tiempos de cambio
# - etc
