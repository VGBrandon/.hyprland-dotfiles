#!/bin/sh 
#
# Iniciador de Waybar
#
# por VGBrandon
#
# ---------------------------------------------------------

#----------------------------------------------------------
# Terminar proceso de las instancias de waybar que se estan ejecutando
#----------------------------------------------------------
killall waybar

#----------------------------------------------------------
# Cargar la configuracion basada en el username (cambiar)
#----------------------------------------------------------
if [ [$USER = "vgbrandon"] ]
then
	waybar -c ~/.config/waybar/config.jsonc & -s ~/.config/waybar/style.css
else
	waybar &
fi
