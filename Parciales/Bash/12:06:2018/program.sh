
validar_codigo_cargo()
{
	existe_cargo=$(grep -c "$1,.*" "$path_cargos")

	if [[ $existe_cargo -ne 1 ]]; then
		echo "El codigo de cargo ingresado es invalido."
		exit 1	
	fi

	descripcion_cargo=$(sed "s/.*, \(.*\)/\1/" "$path_cargos")
}

Informar()
{
	sucursal="$1"

	legajo=$(sed "s/\(.*\),\(.*\),.*,$codigo_cargo,.*/\1/" "$DIR$sucursal")
	nombre=$(sed "s/\(.*\),\(.*\),.*,$codigo_cargo,.*/\2/" "$DIR$sucursal")

	echo "$codigo_cargo - $descripcion_cargo - $legajo - $nombre - $descripcion_sucursal"
}

validar_sucursales()
{
	for file in $(ls "$DIR")
	do
		# obtengo el codigo de la sucursal
		codigo_sucursal=$(echo $file | sed "s/\(.*\).dat/\1/")

		# busco en el archivo de sucursales si es valida
		existe_sucursal=$(grep -c "$codigo_sucursal,.*" "$path_sucursales")

		# en caso de que no sea valida la muevo a /error
		if [[ $existe_sucursal -ne 1 ]]; then
			mv "$DIR$file" "$PWD/error/$file"
		fi

		descripcion_sucursal=$(sed "s/$codigo_sucursal,\(.*\)/\1/" "$path_sucursales")

		echo "Informe"
		echo "Cod Cargo - Descripción del cargo - Legajo - Apellido y Nombre - Descripción sucursal"

		Informar "$file"

	done
}

# Ejemplo de invocacion ./program.sh K13

# path de archivos
path_cargos="mae/CARGOS.txt"
path_sucursales="mae/suc.dat"
DIR="test/"

if [[ $# -ne 1 ]]; then
	echo "Debe ingresar el codigo de cargo como parametro."
	exit 1
fi

codigo_cargo=$1

validar_codigo_cargo $codigo_cargo
validar_sucursales
