#! /bin/sh
# un boton enciende el LED
# otro boton apaga el LED
echo in > /sys/class/gpio/gpio38/direction
echo in > /sys/class/gpio/gpio25/direction
echo out > /sys/class/gpio/gpio39/direction
pul=0
pul2=0
pulsador(){
    if [ $pul == 1 ] ; then
        return 1
    elif [ $pul2 == 1 ] ; then
        return 0
    fi
}
while true
do
    pul=`cat /sys/class/gpio/gpio38/value`
    if [ $pul == 1 ] ; then
        echo "el valor de pul: $pul"
        pulsador
        retP=$?
        echo $retP > /sys/class/gpio/gpio39/value
    fi
    pul2=`cat /sys/class/gpio/gpio25/value`
    if [ $pul2 == 1] ; then
        echo "el valor de pul2: $pul2"
        pulsador
        retP2=$?
        echo $retP2 > /sys/class/gpio/gpio39/value
    fi
done