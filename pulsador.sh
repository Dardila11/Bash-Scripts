#! /bin/sh
#resistencia de leds = 240 ohmios
#resistencia del pulsador = 1k ohmios

#habilitamos el sistema como entrada
echo in > /sys/class/gpio/gpio38/direction
#habilitamos el systema como salida para ese gpio especidifco
echo out > /sys/class/gpio/gpio39/direction
while true
do
    # pul tendrá el valor de gpio38
    pul=`cat /sys/class/gpio/gpio38/value`
    echo "el valor de pul es: $pul"
    if [ $pul == 1 ] ; then
        echo "pulsador presionado"
        echo 1 > /sys/class/gpio/gpio39/value
    else
        echo "No presionado"
        echo 0 > /sys/class/gpio/gpio39/value
    fi
    usleep 250000
done