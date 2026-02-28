#!/bin/bash

# Máximo y min de un arreglo
numeros=(10 5 20 15 3)
MAX=${numeros[0]}
MIN=${numeros[0]}

for n in ${numeros[@]}; do
    if [ "$n" -gt "$MAX" ]; then
        MAX=$n
    elif [ "$n" -lt "$MIN" ]; then
        MIN=$n
    fi
done

echo "Máximo: $MAX"
echo "Mínimo: $MIN"

# Encontrar un elemento
buscar(){
    local n=0
    while [ "$n" -lt "${#numeros[@]}" ] && [ "${numeros[$n]}" -ne "$1" ]; do
        ((n++))
    done

    #podría devolver boolean: 0->true, 1->false
    if [ "$n" -lt "${#numeros[@]}" ]; then
        echo "Número: $1 encontrado" #return 0
    else
        echo "Número: $1 no encontrado" #return 1
    fi
}
buscar 1
buscar 20


# Cantidad de veces que se repite un elemento
lista=(1 2 3 3 2 4 2 5)

contar(){
    local count=0
    for n in "${lista[@]}"; do
        if [ "$n" -eq "$1" ]; then
            ((count++))
        fi
    done
    echo "$count" #retorno de la función, para imprimirlo después
}

echo "El número 2 aparece $(contar 2) veces" 
echo "El número 3 aparece $(contar 3) veces"

# Ordenar arreglo (ascendente)
lista_a=($(echo "${lista[@]}" | tr ' ' '\n' | sort -n))
echo "Ascendente: ${lista_a[@]}"
nums_a=($(echo "${numeros[@]}" | tr ' ' '\n' | sort -n))
echo "Ascendente: ${nums_a[@]}"
