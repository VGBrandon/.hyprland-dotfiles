#!/bin/bash

source $HOME/.hyprland-dotfiles/scripts/tools/title-to-ascii.sh

title_to_ascii "Starting Installation" "green"

# Paso 1: Instalar paquetes oficiales
title_to_ascii "Install official packages" "blue"
$HOME/.hyprland-dotfiles/scripts/install/packages/official.sh

# Paso 2: Instalar paquetes AUR
title_to_ascii "Install AUR packages" "blue"
$HOME/.hyprland-dotfiles/scripts/install/packages/aur.sh

# Paso 3: Configurar dotfiles con stow
title_to_ascii "Configure dotfiles with Stow" "blue"
$HOME/.hyprland-dotfiles/scripts/stow/stow-all.sh

# Paso 4: Configuración post-instalación
title_to_ascii "Configure post install" "blue"
$HOME/.hyprland-dotfiles/scripts/install/post-install.sh

title_to_ascii "Installation Complete" "green"
