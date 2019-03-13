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


pulsador 1 # $pul1
    retP1=$?
    #si retP1==1 enciende el display en 0if [ $retP1 == 1 -a $contador == 0 ] ; then
        disp_off
    fi
    contador=`expr $contador + 1`
    pulsador 1
    retP1=$?
    if [ $retP1 == 1 -a $contador == 1 ] ; then
        uno
    fi
    contador=`expr $contador + 1`
    pulsador 1
    retP1=$?
    if [ $retP1 == 1 -a $contador == 2 ] ; then
        dos
    fi
    contador=`expr $contador + 1`
    pulsador 1
    retP1=$?
    if [ $retP1 == 1 -a $contador == 3 ] ; then
        tres
    fi
    contador=`expr $contador + 1`
    pulsador 1
    retP1=$?