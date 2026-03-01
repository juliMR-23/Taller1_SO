#!/bin/bash

# Mostrar tamaño de archivos en una carpeta
echo "Espacio en disco" 
du -h --max-depth=1 ./ 2>/dev/null

# cnatidad de subcarpetas y archivos que hay dentro de las mismas
echo "Conteo de archivos y subcarpetas"
dir="$PWD"
sub=$(find . -maxdepth 1 -mindepth 1 -type d | wc -l)
echo "Carpeta: $dir | Subcarpetas: $sub"
find . -maxdepth 1 -mindepth 1 -type d | while read -r dir; do
    archivos=$(find "$dir" -maxdepth 1 -type f | wc -l)
    echo "Subcarpeta: $dir | Archivos: $archivos"
done

# Comprimir contenido de una carpeta
# tar -czvf [nombre_archivo.tar.gz] [directorio_a_comprimir]
# tar -czvf respaldo.tar.gz ./carpeta_ejemplo

# Búsquedas con FIND
echo "Archivos modificados en las últimas 24h:"
find . -mtime -1

echo "Archivos que superan los 50MB:"
find . -size +50M