#!/bin/bash

# Salida si algún comando falla
set -e

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Actualiza el sistema
echo -e "${BLUE}Actualizando el sistema...${NC}"
sudo pacman -Syu --noconfirm

# Instala aplicaciones necesarias
echo -e "${BLUE}Instalando aplicaciones oficiales...${NC}"
sudo pacman -S --noconfirm neovim git neofetch waybar thunar font-manager tree curl zsh zsh-completions os-prober ntfs-3g tumbler ffmpegthumbnailer thunar-archive-plugin thunar-media-tags-plugin thunar-volman ark gvfs polkit-gnome stow hyprpaper gnome-keyring seahorse nodejs npm lxappearance

# Configurar Git
echo -e "${CYAN}Configurando Git...${NC}"
git config --global user.name "VGBrandon"
git config --global user.email "villegas.galvan.brandon@gmail.com"
echo -e "${GREEN}Git configurado correctamente.${NC}"

# Descomentar o añadir GRUB_DISABLE_OS_PROBER=false en /etc/default/grub
echo -e "${CYAN}Modificando configuración de GRUB para habilitar os-prober...${NC}"
sudo sed -i 's/^#\?GRUB_DISABLE_OS_PROBER=.*/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub

sudo os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo -e "${GREEN}GRUB ha sido configurado para detectar Windows.${NC}"

echo -e "${BLUE}Instalando Yay...${NC}"
git clone https://aur.archlinux.org/yay.git
cd yay
sudo -u $USER makepkg -si --noconfirm
cd ..
sudo rm -rf yay

echo -e "${BLUE}Instalando aplicaciones desde AUR...${NC}"
yay -S --noconfirm thunar-shares-plugin google-chrome visual-studio-code-bin

echo -e "${BLUE}Cambiando la shell predeterminada a Zsh...${NC}"
chsh -s $(which zsh)


echo -e "${BLUE}Creando symlinks de mis dotfiles...${NC}"
chmod +x rename-exist-files-for-execute-stow.sh
./rename-exist-files-for-execute-stow.sh

echo -e "${BLUE}Instalando gtk de gruvbox-material...${NC}"
git clone https://github.com/TheGreatMcPain/gruvbox-material-gtk.git
cp -r gruvbox-material-gtk/themes/* ~/.themes
cp -r gruvbox-material-gtk/icons/* ~/.icons
sudo rm -rf gruvbox-material-gtk

echo -e "${BLUE}Agregando configuracion adicional de git para las llaves...${NC}"
git config --global credential.helper /usr/lib/git-core/git-credential-libsecret

echo "Instalación y configuración completadas."

