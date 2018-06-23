
validar_codigo_cargo()
{
	id_cargo=$1

	existe_cargo=$(grep -c -i "$id_cargo,.*" "$path_cargos")

	if [[ $existe_cargo -eq 0 ]]; then
		echo "El codigo de cargo ingresado es invalido."
		exit 1	
	fi

	descripcion_cargo=$(grep -i "$id_cargo,.*" "$path_cargos" | sed "s/.*,\(.*\)/\1/")
}

validar_sucursales()
{
	echo "Informe"
	echo "--------------------------------------------------------------------------"
	echo "Cod Cargo - Descripción del cargo"
	echo "$codigo_cargo - $descripcion_cargo"
	echo "--------------------------------------------------------------------------"
	echo "Legajo - Apellido y Nombre - Descripción sucursal"

	for file in $(ls "$DIR")
	do
		# obtengo el codigo de la sucursal
		codigo_sucursal=$(echo $file | grep -i ".*\.dat" | sed "s/\(.*\).dat/\1/")

		# busco en el archivo de sucursales si es valida
		existe_sucursal=$(grep -c -i "$codigo_sucursal,.*" "$path_sucursales")

		# en caso de que no sea valida la muevo a /error
		if [[ $existe_sucursal -eq 0 ]]; then
			mv "$DIR/$file" "$PWD/error/$file"

			continue
		fi

		descripcion_sucursal=$(grep -i "$codigo_sucursal,.*" "$path_sucursales" | sed "s/.*,\(.*\)/\1/")

		grep -i ".*,.*,.*,$codigo_cargo,.*" "$DIR/$file" | sed "s/\(.*\),\(.*\),.*,.*,.*/\1 - \2 - $descripcion_sucursal/"

	done

	echo "--------------------------------------------------------------------------"
}

#/Users/javierleyes/repositorios/SistemasOperativos/Parciales/Bash/12:06:2018

# Ejemplo de invocacion ./program.sh K13

# path de archivos
path_cargos="mae/CARGOS.txt"
path_sucursales="mae/suc.dat"
DIR="test"

if [[ $# -ne 1 ]]; then
	echo "Debe ingresar el codigo de cargo como parametro."
	exit 1
fi

codigo_cargo=$1

validar_codigo_cargo $codigo_cargo
validar_sucursales
