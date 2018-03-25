·#Ejercicio clase 1

chmod +x PS1_a_mayores.sh
chmod +x PS1_restaurar.sh

#PS1_a_mayores.sh
VARIABLE=$PS1
export VARIABLE
PS1=">>"

#PS1_restaurar.sh
PS1=$VARIABLE

#Modo ejecucion:
#. ./PS1_a_mayores.sh
#echo $VARIABLE para ver el valor que tenia antes
#. ./PS1_restaurar.sh