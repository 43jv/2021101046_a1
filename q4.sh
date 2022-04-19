#!/bin/bash

function sortarray()
{
prev=$1
next=$2

if [[ $1 -lt $2 ]]
then

pivot=${array[$1]}

while(( $prev < $next ))
do
while((${array[$prev]} <= $pivot && $prev < $2))
do
prev=$(($prev + 1))
done

while((${array[$next]} > $pivot))
do
next=$(($next-1))
done

if [[ $prev -lt $next ]]
then
tmp=${array[$prev]}
array[$prev]=${array[$next]}
array[$next]=$tmp
fi
done

tmp=${array[$next]}
array[$next]=${array[$1]}
array[$1]=$tmp
tmp=$next

sortarray $1 $((next-1)) array
sortarray $((tmp+1)) $2 array
fi
}


IFS=','
read -a array
size=${#array[@]}

sortarray 0 $((size-1)) array
echo "$(IFS=,;echo "${array[*]}")"
