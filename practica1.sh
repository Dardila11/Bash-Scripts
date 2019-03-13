# Conecte un Display de siete segmentos, un LED y tres pulsadores.
#! /bin/sh
#configuracion display
echo out > /sys/class/gpio/gpio39/direction #A pin13
echo out > /sys/class/gpio/gpio38/direction #B pin12
echo out > /sys/class/gpio/gpio25/direction #C pin11
echo out > /sys/class/gpio/gpio16/direction #D pin10
echo out > /sys/class/gpio/gpio19/direction #E pin9
echo out > /sys/class/gpio/gpio26/direction #F pin8
echo out > /sys/class/gpio/gpio27/direction #G pin7
#configuracion de led
echo out > /sys/class/gpio/gpio24/direction # pin6
#configuracion 3 pulsadores
echo in > /sys/class/gpio/gpio17/direction #pin5
echo in > /sys/class/gpio/gpio28/direction #pin4
echo in > /sys/class/gpio/gpio15/direction #pin3
#funciones
disp_off(){
    echo 0 > /sys/class/gpio/gpio39/value
    echo 0 > /sys/class/gpio/gpio38/value
    echo 0 > /sys/class/gpio/gpio25/value
    echo 0 > /sys/class/gpio/gpio16/value
    echo 0 > /sys/class/gpio/gpio19/value
    echo 0 > /sys/class/gpio/gpio26/value
    echo 0 > /sys/class/gpio/gpio27/value
}

while true
do
    #asignamos los pulsadores
    pul5 = `cat /sys/clas/gpio/gpio17/value`
    pul4 = `cat /sys/clas/gpio/gpio28/value`
    pul3 = `cat /sys/clas/gpio/gpio15/value`

    

done

