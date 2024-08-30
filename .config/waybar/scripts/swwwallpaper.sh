#!/bin/bash

# Directorio de fondos de pantalla
WALLPAPERS_DIR="/home/vgbrandon/Pictures"
# Archivo para almacenar el índice actual del fondo de pantalla
INDEX_FILE="$HOME/.current_wallpaper_index"

# Obtener la lista de archivos de wallpaper1 a wallpaper13
WALLPAPERS=($(ls $WALLPAPERS_DIR/wallpaper{1..13}.{jpg,jpeg,png} 2>/dev/null))

# Leer el índice actual del fondo de pantalla
if [ ! -f "$INDEX_FILE" ]; then
    echo 0 > "$INDEX_FILE"
fi
CURRENT_INDEX=$(cat "$INDEX_FILE")

# Calcular el índice del siguiente fondo de pantalla
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#WALLPAPERS[@]} ))

# Establecer el siguiente fondo de pantalla
swww img -o "HDMI-A-1","DP-1" "${WALLPAPERS[$NEXT_INDEX]}" --transition-type "wipe"

# Guardar el nuevo índice en el archivo
echo $NEXT_INDEX > "$INDEX_FILE"

# Cambiar los colores de pywal
#sleep 2.5 # Esperamos 2s y medio para que termine la animacion de swww
#wal -i "${WALLPAPERS[$NEXT_INDEX]}"
