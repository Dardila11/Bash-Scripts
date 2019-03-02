#! /bin/sh
#configuracion de pines
#echo 39 > /sys/class/gpio/export para el profe
echo out > /sys/class/gpio/gpio39/direction
echo out > /sys/class/gpio/gpio38/direction
pul=27
pul2=3

#procedemos a enviarle la instrucción al led
#bucle infinito
while true
do
    echo 0 > /sys/class/gpio/gpio39/value
    echo 1 > /sys/class/gpio/gpio38/value
    usleep 250000
    echo 1 > /sys/class/gpio/gpio39/value
    echo 0 > /sys/class/gpio/gpio38/value
    usleep 250000

    echo "El valor de pul es $pul"
    echo "La suma de $pul + $pul2 es igual a: $(($pul + $pul2))" #si los parentesis va a mostrar cadena
    echo "La resta de $pul - $pul2 es igual a: $(($pul - $pul2))"
    echo "La multiplicacion de $pul * $pul2 es igual a: $(($pul * $pul2))"
    echo "La division de $pul / $pul2 es igual a: $(($pul / $pul2))"
    echo "el residuo de $pul % $pul2 es igual a: $(($pul % $pul2))"
    echo "el residuo de $pul % $pul2 es igual a: $(($pul % $pul2))"
    echo "Que operacion soy: $(($pul ^ 2))"

done