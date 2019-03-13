#! /bin/sh

author="El siguiente programa es desarrollado por Daniel Ardila"
echo $author
nombres[0]="Daniel"
nombres[1]="Grace"
nombres[2]="Hanna"
echo "El tercer nombre es: ${nombres[*]}"
una_funcion(){
	echo "Corriendo la funcion"
	return 1
}
while true
do
	una_funcion
done
