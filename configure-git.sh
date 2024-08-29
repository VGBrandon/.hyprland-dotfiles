# Configurar Git
echo -e "${CYAN}Configurando Git...${NC}"

# Preguntar si desea configurar Git
read -p "¿Quieres configurar el usuario y correo de Git ahora mismo? [Y/n]: " configure_git

# Establecer 'Y' como valor por defecto si no se ingresa nada
configure_git=${configure_git:-Y}

# Convertir la entrada a minúsculas para facilitar la comparación
configure_git=$(echo "$configure_git" | tr '[:upper:]' '[:lower:]')

if [[ "$configure_git" == "y" || "$configure_git" == "yes" ]]; then
    # Pedir nombre de usuario
    read -p "Ingresa tu nombre de usuario de Git: " git_username
    git config --global user.name "$git_username"

    # Pedir correo electrónico
    read -p "Ingresa tu correo electrónico de Git: " git_email
    git config --global user.email "$git_email"

    echo -e "${GREEN}Git configurado correctamente.${NC}"

    # Mostrar la configuración actual
    echo -e "${CYAN}Configuración actual de Git:${NC}"
    echo "Nombre de usuario: $(git config --global user.name)"
    echo "Correo electrónico: $(git config --global user.email)"
else
    echo -e "${YELLOW}Configuración de Git omitida.${NC}"
fi

