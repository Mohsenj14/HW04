#!/bin/bash
# This program designed and developed by Mohsen Jalayeri in linux bash
# This is a basic program and I will update it regularly.
# you can access this file from: https://github.com/Mohsenj14/HW04

# get number 
getnum() {
printf "=============================================\n"
while true
	do
		printf "Please insert a number: "
		read num

		if [[ "$num" =~ ^[-+]?([1-9][[:digit:]]*|0)$ ]]
			then
			break
		else
			echo "Error, please insert a number"
		fi
done
}

method1() {
isprime=1
str=""
for((i=2; i<num; i++))
do
  if [ $((num%i)) -eq 0 ]
  then
	isprime=0
	str="$str $i, "
  fi
done
if [ $isprime -eq 1 ]
then
echo "$num is a prime number.*****"
else
echo "$num is a composite number. and factors are:" $str
fi
echo "With 1st method number of iteration  is: " $(($i-1))
}

method2() {
isprime=1
b=$(echo -e "sqrt($num)\nquit\n" | bc -q -i | head -2 | tail -1)
x=$num
i=2
while [[ $x -gt 1 &&  $i -le $b ]]
do
	while true
	do
	if [ $x%$i==0 ]
	then
	x=$(($x/$i))
	b=$(echo -e "sqrt($x)\nquit\n" | bc -q -i | head -2 | tail -1)
	break
	fi
	done
	i=$(($i+1))
done
if [ x > 1 ]
then
echo "With 2st method number of iteration  is: " $(($x-1))
fi


}

# Start
getnum
method1
method2
