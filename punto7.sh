encontrar_max_min() {
	local -n arr=$1
	local max=${arr[0]}
	local min=${arr[0]}
	for i in "${arr[@]}"; do
		((i > max)) && max=$i
		((i < min)) && min=$i
	done
	echo "Maximo: $max"
	echo "Minimo: $min"
}

encontrar_elemento() {
	local -n arr=$1
	local elemento=$2
	for i in "${!arr[@]}"; do
		if [[ ${arr[$i]} -eq $elemento ]]; then
			echo "Elemento $elemento encontrado en el indice $1"
			return 0
		fi
	done
	echo "Elemento $elemento no encontrado"
	return 1
}

contar_ocurrencias() {
	local -n arr=$1
	local elemento=$2
	local contador=0

	for i in "${arr[@]}"; do
		[[ $i -eq $elemento ]] && ((contador++))
	done
	echo "El elemento $elemento aparece $contador veces"
}

ordenar_arreglo() {
	local -n arr=$1
	local orden=$2
	if [[ $orden == "asc" ]]; then
		IFS=$'\n' sorted=($(sort -n <<<"${arr[*]}"))
	elif [[ $orden == "desc" ]]; then
		IFS=$'\n' sorted=($(sort -nr <<<"${arr[*]}"))
	else
		echo "Orden no valido. Use 'asc' o 'desc'."
		return 1
	fi
	unset IFS
	echo "Arreglo ordenado: ${sorted[*]}"
}

arreglo=(5 2 8 1 9 3 7 4 6 8)

echo "Arreglo original: ${arreglo[*]}"

encontrar_max_min arreglo
encontrar_elemento arreglo 7
contar_ocurrencias arreglo 8

echo "Ordenado ascendentemente:"
ordenar_arreglo arreglo asc

echo "Ordenado descendentemente:"
ordenar_arreglo arreglo desc
