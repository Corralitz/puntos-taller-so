#!/bin/bash

directorio_principal=$(ls -d directorio_principal_* | sort -n | tail -n 1)

if [ -z "directorio_principal" ]; then
	echo "No se encontro el directorio principal, ejecute el script anterior primero"
	exit 1
fi

find "$directorio_principal" -type f | while read archivo
do
	nombre=$(basename "$archivo" .txt)
	if [ $((nombre % 2)) -eq 0 ]; then
		nuevo_nombre=$((nombre + 1))
		mv "$archivo" "$(dirname "$archivo")/$nuevo_nombre.txt"
		echo "Renombrado: $archivo -> $(dirname "$archivo")/$nuevo_nombre.txt"
	fi
done

echo "Se han renombrado los archivos con nombres pares a impares en $directorio_principal"
