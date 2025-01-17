#!/bin/bash

# Ruta al archivo de ignore de stow
IGNORE_FILE=".stow-local-ignore"

# Función para renombrar archivos en conflicto con .bak
rename_conflict() {
    local file="$1"
    if [[ -e "$file" && ! -L "$file" && ! "$file" =~ \.bak$ ]]; then
        echo "Renombrando archivo en conflicto: $file"
        mv "$file" "$file.bak"
    fi
}

# Función para leer el archivo de ignore y devolver los patrones a ignorar
get_ignore_patterns() {
    if [[ -f "$IGNORE_FILE" ]]; then
        grep -v '^#' "$IGNORE_FILE" | grep -v '^$' # Ignora líneas vacías y comentarios
    else
        echo "" # Si no existe el archivo .stow-local-ignore, no ignoramos nada
    fi
}

# Función para ejecutar stow en modo simulación y verificar conflictos adicionales
simulate_stow() {
    echo "Ejecutando stow en modo simulación..."
    stow -vn
}

# Verificar si un archivo está ignorado
is_ignored() {
    local file="$1"
    local pattern
    for pattern in $(get_ignore_patterns); do
        if [[ "$file" == *"$pattern"* ]]; then
            return 0 # El archivo está ignorado
        fi
    done
    return 1 # El archivo no está ignorado
}

# Revisar posibles conflictos antes de ejecutar stow real
echo "Verificando posibles conflictos antes de ejecutar stow..."

# Recorremos las carpetas de archivos a ser stoweados (suponiendo que las carpetas no están ignoradas)
for dir in */; do
    # Ignoramos si la carpeta está en el archivo .stow-local-ignore
    if is_ignored "$dir"; then
        echo "Ignorando carpeta: $dir"
        continue
    fi

    # Recorremos los archivos dentro de cada directorio
    for file in "$dir"*; do
        if is_ignored "$file"; then
            echo "Ignorando archivo: $file"
            continue
        fi

        # Verificamos si el archivo existe en la ruta real
        if [[ -e "$HOME/$file" && ! -L "$HOME/$file" ]]; then
            rename_conflict "$HOME/$file"
        fi
    done
done

# Ejecutar la simulación de stow para detectar otros conflictos
simulate_stow

echo "Conflictos resueltos. Ahora puedes ejecutar stow real."
