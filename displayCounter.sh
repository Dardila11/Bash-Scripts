#! /bin/sh
# un boton incrementa el contador
# otro boton decrementa el contador
# otro resetea el contador
#configuracion de pines
echo out > /sys/class/gpio/gpio39/direction #A pin13
echo out > /sys/class/gpio/gpio38/direction #B pin12
echo out > /sys/class/gpio/gpio25/direction #C pin11
echo out > /sys/class/gpio/gpio16/direction #D pin10
echo out > /sys/class/gpio/gpio19/direction #E pin9
echo out > /sys/class/gpio/gpio26/direction #F pin8 aqui era el gpio28
echo out > /sys/class/gpio/gpio27/direction #G pin7
echo in > /sys/class/gpio/gpio14/direction #G pin7  <-- configurar pines
echo in > /sys/class/gpio/gpio13/direction #G pin7  <-- configurar pines
echo in > /sys/class/gpio/gpio12/direction #G pin7  <-- configurar pines
pul=0
pul2=0
pul3=0
contador=0
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
#configurar
cuatro(){
    echo 1 > /sys/class/gpio/gpio39/value
    echo 1 > /sys/class/gpio/gpio38/value
    echo 1 > /sys/class/gpio/gpio25/value
    echo 1 > /sys/class/gpio/gpio16/value
    echo 0 > /sys/class/gpio/gpio19/value
    echo 0 > /sys/class/gpio/gpio26/value
    echo 1 > /sys/class/gpio/gpio27/value
}
cinco(){
    echo 1 > /sys/class/gpio/gpio39/value
    echo 1 > /sys/class/gpio/gpio38/value
    echo 1 > /sys/class/gpio/gpio25/value
    echo 1 > /sys/class/gpio/gpio16/value
    echo 0 > /sys/class/gpio/gpio19/value
    echo 0 > /sys/class/gpio/gpio26/value
    echo 1 > /sys/class/gpio/gpio27/value
}
seis(){
    echo 1 > /sys/class/gpio/gpio39/value
    echo 1 > /sys/class/gpio/gpio38/value
    echo 1 > /sys/class/gpio/gpio25/value
    echo 1 > /sys/class/gpio/gpio16/value
    echo 0 > /sys/class/gpio/gpio19/value
    echo 0 > /sys/class/gpio/gpio26/value
    echo 1 > /sys/class/gpio/gpio27/value
}
siete(){
    echo 1 > /sys/class/gpio/gpio39/value
    echo 1 > /sys/class/gpio/gpio38/value
    echo 1 > /sys/class/gpio/gpio25/value
    echo 1 > /sys/class/gpio/gpio16/value
    echo 0 > /sys/class/gpio/gpio19/value
    echo 0 > /sys/class/gpio/gpio26/value
    echo 1 > /sys/class/gpio/gpio27/value
}
ocho(){
    echo 1 > /sys/class/gpio/gpio39/value
    echo 1 > /sys/class/gpio/gpio38/value
    echo 1 > /sys/class/gpio/gpio25/value
    echo 1 > /sys/class/gpio/gpio16/value
    echo 0 > /sys/class/gpio/gpio19/value
    echo 0 > /sys/class/gpio/gpio26/value
    echo 1 > /sys/class/gpio/gpio27/value
}
nueve(){
    echo 1 > /sys/class/gpio/gpio39/value
    echo 1 > /sys/class/gpio/gpio38/value
    echo 1 > /sys/class/gpio/gpio25/value
    echo 1 > /sys/class/gpio/gpio16/value
    echo 0 > /sys/class/gpio/gpio19/value
    echo 0 > /sys/class/gpio/gpio26/value
    echo 1 > /sys/class/gpio/gpio27/value
}
pulsador(){
    if [ $pul == 1 ] ; then  # incrementa el contador
        func_incCounter
    elif [ $pul2 == 1 ] ; then # decrementa el contador
        func_decCounter
    elif [ $pul3 == 1 ] ; then # resetea el contador
        func_resetCounter
    fi
}
func_incCounter(){
    contador=$((contador + 1))
    func_case $contador
}
func_decCounter(){
    if [ $contador != 0 ] ; then
        contador=$((contador - 1))
    else
        echo "No se puede decrementar el valor del contador"
    fi
}
func_resetCounter(){
    contador=0
}
func_case(){
    num=$1 #enviar como parametro
    case $num in 
        0)cero;;
        1)uno;;
        2)dos;;
        3)tres;;
        4)cuatro;;
        5)cinco;;
        6)seis;;
        7)siete;;
        8)ocho;;
        9)nueve;;
        *)disp_off;; #default
    esac
    usleep 250000
}
while true
do
    pul=`cat /sys/class/gpio/gpio38/value`
    if [ $pul == 1 ] ; then
        echo "el valor de pul: $pul"
        pulsador
    fi
    pul2=`cat /sys/class/gpio/gpio25/value`
    if [ $pul2 == 1] ; then
        echo "el valor de pul2: $pul2"
        pulsador
    fi
    pul3=`cat /sys/class/gpio/38/value`  # <-- configurar pin
    if [ $pul3 == 1 ] ; then
        echo "el valor de pul3: $pul3"
        pulsador
    fi
done