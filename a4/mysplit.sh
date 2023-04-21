#! /bin/bash

# Usage statement
if [ $# -lt 1 ]; then
	echo "usage: ./mysplit.sh <filename>";
	exit;
fi

# wordCount is total wordcount of file - 1
wordCount=`wc -l $1 | cut -d " " -f 1`;
((wordCount--));

# floor(0.8 * wordCount)
cutoff=$(($(($wordCount * 4)) / 5));

# read line, if line # is 0 then put in both files
# if line # is within 0.8 cutoff then put in train dataset
# else put it in test dataset
i=0;
while read line;
do
	# Replace semicolon seperator with commas
	line=`echo $line | sed 's/;/,/g'`
	if [ $i -eq 0 ]; then
		echo $line | tee ./train/data.csv > ./test/data.csv;
	elif [ $i -le $cutoff ]; then
		echo $line >> ./train/data.csv;
	else
		echo $line >> ./test/data.csv;
	fi
	((i++))
done < $1

