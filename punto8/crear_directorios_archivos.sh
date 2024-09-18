#!/bin/bash

echo "Cuantos directorios desea crear?"
read num_dir

echo "Cuantos archivos desea crear en cada directorio?"
read num_fil

if [[ ! $num_dir =~ ^[0-9]+$ ]] || [[ ! $num_fil =~ ^[0-9]+$ ]]; then
	echo "Por favor, ingrese un numero valido."
	exit 1
fi

directorio_principal="directorio_principal_$(date +%s)"
mkdir "$directorio_principal"

for ((i=1; i<=num_dir; i++))
do
	directorio="$directorio_principal/directorio_$i"
	mkdir "$directorio"

	for ((j=1; j<=num_fil; j++))
	do
		nombre_archivo=$((RANDOM % 1000))
		touch "$directorio/$nombre_archivo.txt"
	done
done

echo "Se han creado $num_dir directorios, cada uno con $num_fil dentro de $directorio_principal"
