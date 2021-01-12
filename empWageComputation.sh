#!/bin/bash 

attendance(){

	var=$((RANDOM%2))

	if (( var  == 1 ))
	then
		echo present
	else
		echo absent
	fi
}

dailywage(){
	local result="$(attendance)"
	if [ $result == 'present' ]
	then
		wage=$((20 * 8))
	elif [ $result == 'absent' ]
	then
		wage=0
	fi
	echo $wage
}

PartTimeWage(){
	local result="$(attendance)"
	if [ $result == 'present' ]
	then
		wage=$((20 * 8))
	elif [ $result == 'absent' ]
	then
		wage=0
	fi
	echo $wage
}
result="$(PartTimeWage)"
echo $result
