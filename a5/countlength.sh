#! /bin/bash

if [ $# -le 0 ]; then
	echo "usage: ./countlength.sh <filename>"
	exit;
fi

while read line; do
	# Get lengths of passwords
	wordLength=`echo $line | wc -c`;
	echo $wordLength;
done < $1
