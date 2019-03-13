#simulate 
#! /bin/sh
#display_array=("0" "0" "1" "0" "1")
display_array=(0 1 1 0 1 0 1 0)
pul1=0
pul2=0
pul3=0
contador=0
disp_off(){
    display_array=(0 0 0 0 0 0 0 0)
    echo "${display_array[*]}"
}
uno(){
    display_array=(0 0 0 0 0 0 0 1)
    echo "${display_array[*]}"
}
dos(){
    display_array=(0 0 0 0 0 0 1 0)
    echo "${display_array[*]}"
}
tres(){
    display_array=(0 0 0 0 0 1 0 0)
    echo "${display_array[*]}"
}
cuatro(){
    display_array=(0 0 0 0 1 0 0 0)
    echo "${display_array[*]}"
}
cinco(){
    display_array=(0 0 0 1 0 0 0 0)
    echo "${display_array[*]}"
}
seis(){
    display_array=(0 0 1 0 0 0 0 0)
    echo "${display_array[*]}"
}
siete(){
    display_array=(0 1 0 0 0 0 0 0)
    echo "${display_array[*]}"
}
ocho(){
    display_array=(1 0 0 0 0 0 0 0)
    echo "${display_array[*]}"
}
nueve(){
    display_array=(1 0 0 0 0 0 0 1)
    echo "${display_array[*]}"
}
pulsador1(){
    if [ $1 == 1 ] ; then
        return 1
    else
        return 0
    fi
}
pulsador3(){
    if [ $1 == 1 ] ; then
        contador=0
    fi
}
print_display(){
    case $1 in
        0)disp_off;;
        1)uno;;
        2)dos;;
        3)tres;;
        4)cuatro;;
        5)cinco;;
        6)seis;;
        7)siete;;
        8)ocho;;
        9)nueve;;
    esac
}
while true
do
    pulsador1 1 
    retP1=$?
    if [ $retP1 == 1 ] ; then
        print_display $contador
        contador=`expr $contador + 1`
    fi
    pulsador1 1 
    retP1=$?
    if [ $retP1 == 1 ] ; then
        print_display $contador
        contador=`expr $contador + 1`
    fi
    pulsador3 1
    echo "$contador"
    
    

done