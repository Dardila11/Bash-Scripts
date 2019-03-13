#! /bin/sh
#configuracion de pines
echo out > /sys/class/gpio/gpio39/direction #A pin13
echo out > /sys/class/gpio/gpio38/direction #B pin12
echo out > /sys/class/gpio/gpio25/direction #C pin11
echo out > /sys/class/gpio/gpio16/direction #D pin10
echo out > /sys/class/gpio/gpio19/direction #E pin9
echo out > /sys/class/gpio/gpio26/direction #F pin8 aqui era el gpio28
echo out > /sys/class/gpio/gpio27/direction #G pin7

disp_off(){
    echo 0 > /sys/class/gpio/gpio39/value
    echo 0 > /sys/class/gpio/gpio38/value
    echo 0 > /sys/class/gpio/gpio25/value
    echo 0 > /sys/class/gpio/gpio16/value
    echo 0 > /sys/class/gpio/gpio19/value
    echo 0 > /sys/class/gpio/gpio26/value
    echo 0 > /sys/class/gpio/gpio27/value
}
cero(){
    echo 1 > /sys/class/gpio/gpio39/value
    echo 1 > /sys/class/gpio/gpio38/value
    echo 1 > /sys/class/gpio/gpio25/value
    echo 1 > /sys/class/gpio/gpio16/value
    echo 1 > /sys/class/gpio/gpio19/value
    echo 1 > /sys/class/gpio/gpio26/value
    echo 0 > /sys/class/gpio/gpio27/value
}
uno(){
    echo 0 > /sys/class/gpio/gpio39/value
    echo 1 > /sys/class/gpio/gpio38/value
    echo 1 > /sys/class/gpio/gpio25/value
    echo 0 > /sys/class/gpio/gpio16/value
    echo 0 > /sys/class/gpio/gpio19/value
    echo 0 > /sys/class/gpio/gpio26/value
    echo 0 > /sys/class/gpio/gpio27/value
}
dos(){
    echo 1 > /sys/class/gpio/gpio39/value
    echo 1 > /sys/class/gpio/gpio38/value
    echo 0 > /sys/class/gpio/gpio25/value
    echo 1 > /sys/class/gpio/gpio16/value
    echo 1 > /sys/class/gpio/gpio19/value
    echo 0 > /sys/class/gpio/gpio26/value
    echo 1 > /sys/class/gpio/gpio27/value
}
tres(){
    echo 1 > /sys/class/gpio/gpio39/value
    echo 1 > /sys/class/gpio/gpio38/value
    echo 1 > /sys/class/gpio/gpio25/value
    echo 1 > /sys/class/gpio/gpio16/value
    echo 0 > /sys/class/gpio/gpio19/value
    echo 0 > /sys/class/gpio/gpio26/value
    echo 1 > /sys/class/gpio/gpio27/value
}

while true
do
    num=$1 #enviar como parametro
    case $num in 
        0)cero;;
        1)uno;;
        2)dos;;
        3)tres;;
        *)disp_off;; #default
    esac
    usleep 250000
done