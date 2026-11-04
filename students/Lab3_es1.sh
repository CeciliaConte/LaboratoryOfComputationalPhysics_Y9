#!/bin/bash

# checking if the user provided an input
if [ -z $1 ]
then
    echo "this script requires as input the name of the file to be read"
    exit
fi

# check if the file is there
if [ ! -f "./$1" ]
then
    echo "the file ./$1 does not exist!"

else
    file=$1
fi


awk -F','  'NR > 1 {
			letter = substr($1,1,1)
			counter[letter]++
			
		   	}'


END {
    for (letter in counter) {
        print letter "," counter[letter]
    }
}' "./$1"
