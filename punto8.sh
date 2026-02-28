#!/bin/bash

# Crear x carpetas
read -p "Ingrese cantidad de carpetas a crear: " CANT
mkdir -p contenedor

for ((i=1; i<=CANT; i++)); do
    mkdir -p "contenedor/carpeta_$i"
done

# Crear carpetas con archivos de nombres aleatorios
read -p "Ingrese cantidad de carpetas (X): " x
read -p "Ingrese cantidad de archivos por carpeta (Y): " y
mkdir -p "aleatorios"

for ((i=1; i<=x; i++)); do
    dir="aleatorios/carpeta$i"
    mkdir -p "$dir"
    for ((j=1; j<=y; j++)); do
        touch "$dir/$RANDOM.txt"
    done
done

# Modificar nombres de archivos pares a impares
find aleatorios -type f | while read -r archivo; do
    nombre=$(basename "$archivo" .txt) #toma solo los números
    if (( nombre % 2 == 0 )); then
        nuevo=$((nombre + 1))
        dir_padre=$(dirname "$archivo")
        mv "$archivo" "$dir_padre/$nuevo.txt"
    fi
done