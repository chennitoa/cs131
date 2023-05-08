#! /bin/bash

if [ $# -le 0 ]; then
	echo "usage: ./filllines.sh <filename>";
	exit;
fi

lastI=0;
while read line; do
	# Length of password
	column=`echo $line | cut -d " " -f 2`;
	while [ $lastI -lt $column ]; do
		# Print lines with 0 until reaching next number
		echo "0 $lastI"
		((lastI++))
	done
	((lastI++))
	# So lastI is always greater than $column
	echo $line
done < $1
