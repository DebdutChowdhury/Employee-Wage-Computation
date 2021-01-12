#!/bin/bash -x

# function for employee attendance
attendance(){

	var=$((RANDOM%2))

	if (( var  == 1 ))
	then
		echo present
	else
		echo absent
	fi
}

# function for eployee daily wage
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

# function for part time employee and wage
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

# function for solve wage using switch case
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

# function for every employe monthly wage
month_wage(){
	local emp_rate_per_hr=20
	local full_time=1
	local part_time=0
	local total_salary=0
	local emp_check=$((RANDOM%3))
	for (( i=0; i<=20; i++ ))
	do
		case $emp_check in
			$part_time) empHrs=4;;
			$full_timr) empHrs=8;;
			*) empHrs=0;;
		esac
		salary=$((empHrs*emp_rate_per_hr))
		total_salary=$(($salary+$total_salary))
	done
	echo $total_salary
}
result="$(month_wage)"
echo $result
