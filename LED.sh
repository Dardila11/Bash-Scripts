#! /bin/sh
#configuracion de pines
#echo 39 > /sys/class/gpio/export para el profe
echo out > /sys/class/gpio/gpio39/direction

#procedemos a enviarle la instrucción al led
#bucle infinito
while true
do
    echo 0 > /sys/class/gpio/gpio39/value
    sleep 1 #usleep 100000 microsegundo
    echo 1 > /sys/class/gpio/gpio39/value
    sleep 1 #usleep 100000 microsegundo
done