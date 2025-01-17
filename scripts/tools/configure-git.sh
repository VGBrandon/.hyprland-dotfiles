# Preguntar si desea configurar Git
read -p "¿Quieres configurar el usuario y correo de Git ahora mismo? [Y/n]: " configure_git

# Establecer 'Y' como valor por defecto si no se ingresa nada
configure_git=${configure_git:-Y}

# Convertir la entrada a minúsculas para facilitar la comparación
configure_git=$(echo "$configure_git" | tr '[:upper:]' '[:lower:]')

if [[ "$configure_git" == "y" || "$configure_git" == "yes" ]]; then
    # Función para validar el nombre de usuario
    is_valid_username() {
        local username="$1"
        # Comprobar si el nombre de usuario no está vacío y tiene un mínimo de 3 caracteres
        [[ -n "$username" && ${#username} -ge 3 ]]
    }

    # Pedir nombre de usuario
    while true; do
        read -p "Ingresa tu nombre de usuario de Git (mínimo 3 caracteres): " git_username
        if is_valid_username "$git_username"; then
            git config --global user.name "$git_username"
            echo -e "${GREEN}Nombre de usuario configurado correctamente.${NC}"
            break
        else
            echo -e "${RED}Por favor, ingresa un nombre de usuario válido (mínimo 3 caracteres).${NC}"
        fi
    done

    # Función para validar el correo electrónico
    is_valid_email() {
        local email="$1"
        # Expresión regular para validar el correo electrónico
        [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]
    }

    # Pedir correo electrónico
    while true; do
        read -p "Ingresa tu correo electrónico de Git: " git_email
        if is_valid_email "$git_email"; then
            git config --global user.email "$git_email"
            echo -e "${GREEN}Correo electrónico configurado correctamente.${NC}"
            break
        else
            echo -e "${RED}Por favor, ingresa un correo electrónico válido.${NC}"
        fi
    done

    echo -e "${GREEN}Git configurado correctamente.${NC}"

    # Mostrar la configuración actual
    echo -e "${CYAN}Configuración actual de Git:${NC}"
    echo "Nombre de usuario: $(git config --global user.name)"
    echo "Correo electrónico: $(git config --global user.email)"
else
    echo -e "${YELLOW}Configuración de Git omitida.${NC}"
fi
