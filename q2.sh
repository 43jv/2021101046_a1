#!/bin/bash

#Reading each line and storing in quote and author 

while IFS="~" read quote author 
do 
    #ignoring whitespace
    if [[ "$quote" =~ [^[:space:]] ]]; then
    #output in speech.txt
    echo "$author once said, \"${quote%. }\"." >> speech.txt
    fi
#input from quotes.txt
done < quotes.txt