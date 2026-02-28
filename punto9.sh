#!/bin/bash

# Mostrar tamaño de archivos en una carpeta
echo "Espacio en disco" 
du -h --max-depth=1 ./ 2>/dev/null

# Contar subcarpetas y archivos dentro de ellas
echo "Conteo de archivos por carpeta"
find . -maxdepth 1 -type d | while read -r dir; do
    # Ignorar el directorio actual (.)
    [ "$dir" == "." ] && continue
    archivos=$(find "$dir" -maxdepth 1 -type f | wc -l)
    echo "Carpeta: $dir | Archivos: $archivos"
done

# Comprimir contenido de una carpeta
# tar -czvf [nombre_archivo.tar.gz] [directorio_a_comprimir]
# tar -czvf respaldo.tar.gz ./carpeta_ejemplo

# Búsquedas con FIND
echo "Archivos modificados en las últimas 24h:"
find . -mtime -1

echo "Archivos que superan los 50MB:"
find . -size +50M