#! /bin/bash

if [ $# -lt 2 ]; 
then
	# if number of arguments is less than 2,
	# print usage statement and exit
	echo "usage: ./randomsample.sh percent fileinput";
	exit;
fi

# Reads line from filename in $2
while read line;
do
	# get random number and if less than percent, print the line
	if [ $(($RANDOM % 100)) -lt $1 ];
	then
		echo $line;
	fi
done < $2

