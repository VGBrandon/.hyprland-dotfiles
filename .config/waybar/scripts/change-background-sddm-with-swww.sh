#!/bin/bash

# Nombre de la carpeta del tema
THEME_NAME="sddm-astronaut-theme" #Cambiar dependiendo de tu tema

# Ruta al archivo theme.conf del tema SDDM
THEME_CONF="/usr/share/sddm/themes/$THEME_NAME/theme.conf"

# Directorio donde se almacenarán los fondos en el tema de SDDM
# Crear carpeta llamada fondos-dinamicos dentro de tu tema
DYNAMIC_WALLPAPERS_DIR="/usr/share/sddm/themes/$THEME_NAME/fondos-dinamicos"

# Verifica si el directorio fondos-dinamicos existe, y si no, lo crea
if [ ! -d "$DYNAMIC_WALLPAPERS_DIR" ]; then
    mkdir -p "$DYNAMIC_WALLPAPERS_DIR"
fi

# Obtén la ruta del fondo de swww
WALLPAPER_PATH=$(swww query | grep "currently displaying: image:" | head -n 1 | awk -F'image: ' '{print $2}')

# Obtén el nombre del archivo del fondo de pantalla
FILENAME=$(basename "$WALLPAPER_PATH")

# Verifica si el archivo ya existe en la carpeta fondos-dinamicos
if [ ! -f "$DYNAMIC_WALLPAPERS_DIR/$FILENAME" ]; then
    # Si no existe, copia el archivo al directorio de fondos-dinamicos
    cp "$WALLPAPER_PATH" "$DYNAMIC_WALLPAPERS_DIR/"
fi

# Actualiza la propiedad background en theme.conf
 sed -i "s|^Background=.*|Background=fondos-dinamicos/$FILENAME|" "$THEME_CONF"
