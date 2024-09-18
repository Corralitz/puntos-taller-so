#!/bin/bash

echo "Cuantos directorios desea crear?"
read num_dir

if [[ ! $num_dir =~ ^[0-9]+$ ]]; then
	echo "Por favor, ingrese un numero valido."
	exit 1
fi

directorio_principal="directorio_principal_$(date +%s)"
mkdir "$directorio_principal"

for ((i=1; i<=num_dir; i++))
do
	mkdir "$directorio_principal/directorio_$i"
done

echo "Se han creado $num_dir directorios dentro de $directorio_principal"
