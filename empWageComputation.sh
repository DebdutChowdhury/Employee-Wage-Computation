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

daily_wage(){
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

Part_Time_Wage(){
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

switch_case(){
	local emp_rate_per_hr=20
	local part_time=0
	local full_time=1
	local emp_check=$((RANDOM%3))
	
	case $emp_check in
		$full_time) empHrs=8;;
		$part_time) empHrs=4;;
		*) empHrs=0;;
	esac
	salary=$((empHrs*emp_rate_per_hr))
	echo $salary
	
}
result="$(switch_case)"
echo $result
