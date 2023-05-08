#! /bin/bash

if [ $# -le 0 ]; then
	echo "usage: ./filllines.sh <filename>";
	exit;
fi

lastI=0;
while read line; do
	column=`echo $line | cut -d " " -f 2`;
	while [ $lastI -lt $column ]; do
		echo "0 $lastI"
		((lastI++))
	done
	((lastI++))
	echo $line
done < $1
