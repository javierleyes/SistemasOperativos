
# Como llamar al programa echo "10,5" | ./cant_disp.sh 
# Programa que lee los caracteres que recibe por parametro
# Caracter especiales | \

# Opciones validas
#INPUT=$(sed 's/,/,/')
INPUT=$(grep '[0-9]*,[1-5]')

echo "El valor ingresado por parametro es $INPUT"

HUESPEDES=$(echo $INPUT | sed 's-\([0-9]*\),\([1-5]\{1\}\)-\1-')
ESTRELLAS=$(echo $INPUT | sed 's-\([0-9]*\),\([1-5]\{1\}\)-\2-')

# Opcion posible
#ESTRELLAS=$(echo $INPUT | sed 's-\([0-9]\{1,2\}\),\([1-5]\{1\}\)-\2-')

echo "Cantidad de huespedes: $HUESPEDES"
echo "Cantidad de estrellas: $ESTRELLAS"

# -c para que nos devuelva la cantidad de lineas en vez de los nombres
CANTIDAD=$(grep -c ".*;.*;$ESTRELLAS;.*;$HUESPEDES;29/03/2018;DISP$" disponibilidad.dat)

echo "Cantidad de lugares disponibles: $CANTIDAD"

