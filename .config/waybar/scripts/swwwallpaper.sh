#!/bin/bash

# Directorio de fondos de pantalla
WALLPAPERS_DIR="/home/vgbrandon/Pictures"

# Archivo para almacenar el nombre del fondo de pantalla actual
CURRENT_WALLPAPER_FILE="$HOME/.current-wallpaper"

# Obtener la lista de nombres de archivos de wallpapers en el directorio
WALLPAPERS=($(ls "$WALLPAPERS_DIR"/*.{jpg,jpeg,png} 2>/dev/null | xargs -n 1 basename))

# Verificar si el archivo .current-wallpaper existe, si no, lo crea vacío
if [ ! -f "$CURRENT_WALLPAPER_FILE" ]; then
    touch "$CURRENT_WALLPAPER_FILE"
fi

# Leer el nombre del fondo de pantalla actual desde el archivo
CURRENT_WALLPAPER_NAME=$(basename "$(cat "$CURRENT_WALLPAPER_FILE")")

# Si el archivo .current-wallpaper está vacío, establecer el primer fondo de pantalla por defecto
if [ -z "$CURRENT_WALLPAPER_NAME" ]; then
    CURRENT_WALLPAPER_NAME="${WALLPAPERS[0]}"
    echo "$CURRENT_WALLPAPER_NAME" > "$CURRENT_WALLPAPER_FILE"
    
    # Establecer el fondo de pantalla y salir del script
    swww img -o "HDMI-A-1","DP-1" "$WALLPAPERS_DIR/$CURRENT_WALLPAPER_NAME" --transition-type "wipe"
    
    # Cambiar los colores de pywal (opcional)
    #wal -i "$WALLPAPERS_DIR/$CURRENT_WALLPAPER_NAME"
    
    # Cambiar fondo de SDDM con el fondo nuevo de swww
    echo "ejecutando script para sddm"
    $HOME/.config/waybar/scripts/change-background-sddm-with-swww.sh
    
    exit 0
fi

# Encontrar el índice del fondo de pantalla actual en el array
CURRENT_INDEX=-1
for i in "${!WALLPAPERS[@]}"; do
    if [ "${WALLPAPERS[$i]}" == "$CURRENT_WALLPAPER_NAME" ]; then
        CURRENT_INDEX=$i
        break
    fi
done

# Calcular el índice del siguiente fondo de pantalla
if [ $CURRENT_INDEX -ge 0 ]; then
    NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#WALLPAPERS[@]} ))
else
    NEXT_INDEX=0
fi

# Establecer el siguiente fondo de pantalla
swww img -o "HDMI-A-1","DP-1" "$WALLPAPERS_DIR/${WALLPAPERS[$NEXT_INDEX]}" --transition-type "wipe"

# Guardar el nuevo nombre del fondo de pantalla en el archivo
echo "${WALLPAPERS[$NEXT_INDEX]}" > "$CURRENT_WALLPAPER_FILE"

# Cambiar los colores de pywal (opcional)
#wal -i "$WALLPAPERS_DIR/${WALLPAPERS[$NEXT_INDEX]}"

# Cambiar fondo de SDDM con el fondo nuevo de swww
echo "ejecutando script para sddm"
$HOME/.config/waybar/scripts/change-background-sddm-with-swww.sh
