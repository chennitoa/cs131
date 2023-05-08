#! /bin/bash

if [ $# -le 0 ]; then
	echo "usage: ./generateboxplot.sh <filename>";
	exit;
fi

length=`wc -l $1 | cut -d " " -f 1`;

i=0;

while read line; do
	# Generate quartile and median / range data
	if [ $i -eq 0 ]; then
		echo $line;
	elif [ $i -eq `echo "$length / 4" | bc` ]; then
		echo $line;
	elif [ $i -eq `echo "$length / 2" | bc` ]; then
		echo $line;
	elif [ $i -eq `echo "3 * $length / 4" | bc` ]; then
	       echo $line;
	elif [ $i -eq `echo "$length - 1" | bc` ]; then
 		echo $line;		
	fi
	((i++))
done < $1
