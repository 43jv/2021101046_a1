#!/bin/bash

#FILE INPUT AS COMMAND LINE
FILENAME=$1

# a. Prints size of file
FILESIZE=$(stat -c%s "$FILENAME")
echo "$FILESIZE bytes"

# b. Prints total number of lines
cat $FILENAME | wc -l 

# c. Prints total number of words 
cat $FILENAME | wc -w 

# d. Counts number of words in each line
line_num=1
while read line
do
printf "Line No: $line_num - Count of words:$(echo $line | wc -w)\n"
((line_num++))
done < $FILENAME

# e. Prints number of repeated words 
sed -e 's/[^[:alpha:]]/ /g' $FILENAME | tr '\n' " " |  tr -s " " | tr " " '\n'| tr 'A-Z' 'a-z' | sort | uniq -c | sort -nr | while read count name
do 
    # if count is not 1
    if [ ${count} -gt 1 ]
    then 
        echo "Word: ${name} - Count of repetition: ${count}"
    fi
done

