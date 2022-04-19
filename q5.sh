#!/bin/bash

#   a. Prints string in reverse
read strIn
size=$(expr "$strIn" : '.*')

strRev=""

i=$size-1
while ((i>=0))
do
    strRev="$strRev${strIn:$i:1}"
    ((i--))
done
echo "$strRev"

# b. Reverse string caesar cipher
echo "$strRev" | tr '[a-z]' '[b-za-a]' | tr '[A-Z]' '[B-ZA-A]'

# c. Print half string in reverse
half=size/2

strHalf=""
j=$half-1
while((j>=0))
do 
    strHalf="$strHalf${strIn:$j:1}"
    ((j--))
done
echo -n "$strHalf"

j=$half
while((j<$size))
do 
    echo -n "${strIn:$j:1}"
    ((j++))
done
     