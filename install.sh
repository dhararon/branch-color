#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -u  # Treat unset variables as an error

# Colores para mensajes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función para mensajes de error
abort() {
    echo -e "${RED}[ERROR]${NC} $@"
    exit 1
}

# Función para mensajes informativos
info() {
    echo -e "${GREEN}[INFO]${NC} $@"
}

# Función para mensajes de advertencia
warn() {
    echo -e "${YELLOW}[WARNING]${NC} $@"
}

# Verificar que git esté instalado
if ! command -v git &> /dev/null; then
    abort "Git no está instalado. Por favor, instala git antes de continuar."
fi

# Verificar si git está inicializado en el directorio actual
if ! [ -d ./.git ]; then
    abort "Git no está inicializado en $(pwd). Ejecuta 'git init' primero."
fi 

info "Gracias por usar branch-color. Comenzando la instalación...\n"

# Limpiar instalaciones previas
if [ -d /tmp/branch-color ]; then
    info "Eliminando versiones anteriores..."
    rm -rf /tmp/branch-color
fi

# Descargar el proyecto
info "Descargando el proyecto branch-color..."
git clone --quiet https://github.com/dhararon/branch-color.git /tmp/branch-color || abort "No se pudo clonar el repositorio"

info "Copiando archivos a los hooks de git..."

# Crear directorio de colores si no existe
mkdir -p .git/hooks/colors || abort "No se pudo crear el directorio .git/hooks/colors"

# Eliminar directorio de colores si ya existe
if [ -d ./.git/hooks/colors ]; then
    rm -rf ./.git/hooks/colors/*
else
    mkdir -p .git/hooks/colors
fi

# Eliminar script post-checkout si existe 
if [ -f ./.git/hooks/post-checkout ]; then
    warn "Reemplazando hook post-checkout existente..."
    rm -f ./.git/hooks/post-checkout
fi

# Copiar archivos al hook
cp -f /tmp/branch-color/colors/*.json ./.git/hooks/colors/ || abort "No se pudieron copiar los archivos de color"
cp -f /tmp/branch-color/post-checkout ./.git/hooks/ || abort "No se pudo copiar el hook post-checkout"
chmod +x ./.git/hooks/post-checkout || abort "No se pudo hacer ejecutable el hook post-checkout"

# Limpiar archivos temporales
rm -rf /tmp/branch-color

# Sugerir agregar .vscode/settings.json a .gitignore
if ! grep -q ".vscode/settings.json" .gitignore 2>/dev/null; then
    warn "Se recomienda añadir .vscode/settings.json a tu archivo .gitignore"
    read -p "¿Deseas añadir .vscode/settings.json a .gitignore? (s/n): " add_to_gitignore
    if [[ "$add_to_gitignore" =~ ^[Ss]$ ]]; then
        echo ".vscode/settings.json" >> .gitignore
        info "Añadido .vscode/settings.json a .gitignore"
    fi
fi

info "¡Instalación completada! Cambia de rama con 'git checkout' para ver el cambio de color en VSCode."
info "Para probar: git checkout main (o cualquier otra rama)"