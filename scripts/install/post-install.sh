#!/bin/bash

# Cambiar a zsh solo si no estás usando zsh
[[ "$SHELL" != *"zsh"* ]] && chsh -s $(which zsh) && echo "Shell cambiado a zsh. Cierra y abre de nuevo tu sesión."
