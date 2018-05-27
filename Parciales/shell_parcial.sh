#!/bin/bash

# Recibe el nombre del archivo
validar_archivo()
{
	# Valido archivo regular
	if [ ! -f "$1" ]
	then
		echo "El archivo no es regular"
		return 0
	fi

	echo "El archivo es regular"
	
	# Valido formato del nombre
	formato_es_valido=$(echo "$1" | grep -c -i "^AP_[0-9]\{6\}\.log$")
	
	if [ $formato_es_valido != 1 ]
	then
		echo "El formato del nombre no es valido"
		return 0
	fi

	echo "El formato del nombre es valido"

	anio=$(echo "$1" | sed 's/\(AP_\)\([0-9]\{4\}\)\([0-9]\{2\}\)\.log/\2/')
	echo "Anio: $anio"

	mes=$(echo "$1" | sed 's/\(AP_\)\([0-9]\{4\}\)\([0-9]\{2\}\)\.log/\3/')
	echo "mes: $mes"

	anio_actual=$(date +%Y)

	mes_actual=$(date +%m)

	# Anio adelantado
	if [ $anio -gt $anio_actual ]
	then
		return	0
	fi

	# Mes adelantado
	if [ $anio -eq $anio_actual ] && [ $mes -gt $mes_actual ]
	then
		return 0
	fi

	# Obtengo codigo de aplicacion
	cod_aplicacion=$(head -n 1 "$1" | sed 's/\(.*\);\(.*\);\(.*\);\(.*\)/\3/')

	echo "Codigo aplicacion: $cod_aplicacion"

	# Verifico si es una aplicacion valida
	aplicacion_valida=$(cat $path_maestro | grep -c -i "^$cod_aplicacion,.*, activo$")

	if [ $aplicacion_valida != 0 ]
	then
		cat "$1" |grep '.*;"ERROR";.*;.*'
	fi

}

# Llamada al script 
# ./shell_parcial.sh $HOME/SistemasOperativos/Parciales/test

# ESTRUCTURA DE DIRECTORIOS
# $HOME/SistemasOperativos/Parciales/test
# Directorio que recibe por parametro
echo "Directorio: $1"

# Path archivo maestro
path_maestro="$HOME/SistemasOperativos/Parciales/mae/aplic.dat"

cd "$1"

for file in *; 
do
	validar_archivo "$file"
done

 