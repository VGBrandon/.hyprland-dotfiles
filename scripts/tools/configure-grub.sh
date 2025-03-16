#!/bin/bash

# Ruta del archivo de configuración de GRUB
GRUB_CONF="/etc/default/grub"

# Descomentar la línea de GRUB_DISABLE_OS_PROBER si está comentada
sed -i 's/^#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' "$GRUB_CONF"

# Habilitar os-prober si la línea aún dice "true"
sed -i 's/GRUB_DISABLE_OS_PROBER=true/GRUB_DISABLE_OS_PROBER=false/' "$GRUB_CONF"

# Ejecutar os-prober para detectar sistemas operativos
os-prober

# Actualizar GRUB
grub-mkconfig -o /boot/grub/grub.cfg
