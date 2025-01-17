#!/bin/bash

# Directorio de los dotfiles
DOTFILES_DIR="$HOME/.hyprland-dotfiles"
TARGET_DIR="$HOME"

# Ejecutar stow en modo simulación y devolver el error si hay conflictos
run_stow_simulation() {
    echo "Ejecutando stow en modo simulación..."
    stow -n -d "$DOTFILES_DIR" -t "$TARGET_DIR" . 2>&1
}

# Renombrar archivo en conflicto
rename_conflict() {
    local file="$1"
    local target_file="$TARGET_DIR/$file"

    # Verificar si el archivo de destino existe y no es un enlace simbólico ni tiene el sufijo .bak
    if [[ -e "$target_file" && ! -L "$target_file" && ! "$target_file" =~ \.bak$ ]]; then
        echo "Renombrando archivo en conflicto: $target_file"
        mv "$target_file" "$target_file.bak"

        # Verificar si el archivo se renombró correctamente
        if [[ -e "$target_file.bak" ]]; then
            echo "Archivo renombrado con éxito a: $target_file.bak"
        else
            echo "Error al renombrar el archivo: $target_file"
        fi
    else
        echo "El archivo ya está renombrado o no se puede renombrar: $target_file"
    fi
}

# Reintentar hasta que no haya conflictos
while true; do
    # Ejecutar stow en modo simulación y capturar el resultado
    result=$(run_stow_simulation)

    echo "Resultado de la simulación:"
    echo "$result"

    # Si no hay conflictos, salir del loop
    if ! echo "$result" | grep -q "over existing target"; then
        echo "Conflictos resueltos. Ahora puedes ejecutar stow real."
        break
    fi

    # Renombrar archivos en conflicto
    echo "$result" | grep "over existing target" | while read -r line; do
        echo "Línea con conflicto: $line"
        conflict_file=$(echo "$line" | sed 's/.*over existing target \(.*\) since.*/\1/')

        if [[ -n "$conflict_file" ]]; then
            rename_conflict "$conflict_file"
        fi
    done

    # Verificar otros errores críticos
    if echo "$result" | grep -q -E "cannot stow|All operations aborted"; then
        echo "Error detectado durante la simulación de stow:"
        echo "$result"
        echo "Abortando el script debido a un error crítico."
        exit 1
    fi
done
