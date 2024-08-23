#!/bin/bash

# Colores
CYAN='\033[0;36m'
NC='\033[0m'

# Función para mostrar números en ASCII
show_ascii_number() {
  case $1 in
    3)
      echo "  /$$$$$$ "
      echo " /$$__  $$"
      echo "|__/  \ $$"
      echo "   /$$$$$/"
      echo "  |___  $$"
      echo " /$$  \ $$"
      echo "|  $$$$$$/"
      echo " \______/ "
      ;;
    2)
      echo "  /$$$$$$ "
      echo " /$$__  $$"
      echo "|__/  \ $$"
      echo "  /$$$$$$/"
      echo " /$$____/ "
      echo "| $$      "
      echo "| $$$$$$$$"
      echo "|________/"
      ;;
    1)
      echo "   /$$    "
      echo " /$$$$    "
      echo "|_  $$    "
      echo "  | $$    "
      echo "  | $$    "
      echo "  | $$    "
      echo " /$$$$$$  "
      echo "|______/  "
      ;;
    "REINICIANDO")
      echo " /$$$$$$$          /$$         /$$         /$$                        /$$         "
      echo "| $$__  $$        |__/        |__/        |__/                       | $$         "
      echo "| $$  \ $$ /$$$$$$ /$$/$$$$$$$ /$$ /$$$$$$$/$$ /$$$$$$ /$$$$$$$  /$$$$$$$ /$$$$$$ "
      echo "| $$$$$$$//$$__  $| $| $$__  $| $$/$$_____| $$|____  $| $$__  $$/$$__  $$/$$__  $$"
      echo "| $$__  $| $$$$$$$| $| $$  \ $| $| $$     | $$ /$$$$$$| $$  \ $| $$  | $| $$  \ $$"
      echo "| $$  \ $| $$_____| $| $$  | $| $| $$     | $$/$$__  $| $$  | $| $$  | $| $$  | $$"
      echo "| $$  | $|  $$$$$$| $| $$  | $| $|  $$$$$$| $|  $$$$$$| $$  | $|  $$$$$$|  $$$$$$/"
      echo "|__/  |__/\_______|__|__/  |__|__/\_______|__/\_______|__/  |__/\_______/\______/ "
      ;;
  esac
}

# Preguntar al usuario si desea reiniciar
read -p "¿Desea reiniciar ahora para que se carguen bien todos los cambios? [Y/n]: " respuesta

# Si la respuesta es vacía, se asume "Y"
respuesta=${respuesta:-Y}

# Convertir la respuesta a minúsculas para manejar tanto "Y" como "y"
respuesta=$(echo $respuesta | tr '[:upper:]' '[:lower:]')

if [[ $respuesta == "y" || $respuesta == "yes" ]]; then
    echo -e "${CYAN}Reiniciando en...${NC}"
    for i in 3 2 1; do
        show_ascii_number $i
        sleep 1
    done
    show_ascii_number "REINICIANDO"
    sleep 1
    sudo reboot
else
    echo -e "${CYAN}No se reiniciará el sistema.${NC}"
fi

