#! /bin/sh
echo in > /sys/class/gpio/gpio25/direction
echo out > /sys/class/gpio/gpio39/direction
echo in > /sys/class/gpio/gpio38/direction
echo out > /sys/class/gpio/gpio16/direction
hola(){
        echo "hola $1 $2"
        return 10
}
pulsador(){
        if [ $1 == 1 ] ; then
                echo "pul presionado"
                return 1
        else                                   
                echo "pul no presionado" 
                return 0
        fi                   
}                                              
while true                                     
do                                             
        pul1=`cat /sys/class/gpio/gpio25/value`   
        #echo 0 > /sys/class/gpio/gpio16/value       
        echo "el valor de pul1 es: $pul1"            
        pul2=`cat /sys/class/gpio/gpio38/value`      
        echo "el valor de pul2 es: $pul2"            
        pulsador $pul1
        retP1=$?
        echo "Estado red P1: $retP1"
        # operacion de transferencia
        echo $retP1 > /sys/class/gpio/gpio39/value
        pulsador $pul2
        retP2=$?
        echo "Estado red P1: $retP2"
        echo $retP2 > /sys/class/gpio/gpio16/value
        usleep 250000
done