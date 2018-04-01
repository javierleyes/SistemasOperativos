#Creo el archivo donde buscar los archivos *.txt
#echo "DIRABUS=$HOME/ejercicio_2" > INICIO.dat

#Para ejecutar el archivo y la varible quede disponible en la "memoria"
#. ./INICIO.dat

#Leer DIRABUS, del archivo INICIO.dat
#VAR_DIRABUS=$(grep '^DIRABUS=' $HOME/INICIO.dat)

NUMERO_CICLO=1

while true
do

	#Guardo el directorio donde buscar los archivos .txt
	DIRECTORIO=$(sed 's/DIRABUS=//' $HOME/INICIO.dat)

	#Hace la busqueda y escribe el archivo de salida
	(cd $DIRECTORIO && ls -1 *.txt) > $HOME/salida_ej2/ciclo$NUMERO_CICLO.txt

	NUMERO_CICLO=$(($NUMERO_CICLO + 1))

	sleep 10

done

#debug
#archivos=$(cd $DIRECTORIO &&  ls -1 *.txt)
#echo $archivos
