#! /bin/bash

if [ $# -le 0 ]; then
	echo "usage: ./splitstrength.sh <filename>";
	exit;
fi

i=0;

while read line; do
	if [ $i -gt 0 ]; then
		passwordStrength=`echo $line | awk 'BEGIN {FS=","} {print $2}'`;
		password=`echo $line | awk 'BEGIN {FS=","} {print $1}'`
		if [ $passwordStrength -eq 0 ]; then
			echo $password >> weak.csv;
		elif [ $passwordStrength -eq 1 ]; then
			echo $password >> medium.csv;
		elif [ $passwordStrength -eq 2 ]; then
			echo $password >> strong.csv;
		else
			echo "$passwordStrength was invalid";
		fi
	fi
	((i++))
	if [ $i -eq 20000 ]; then
		exit;
	fi
done < $1
