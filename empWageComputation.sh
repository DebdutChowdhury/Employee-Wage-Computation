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

# function for calculate time for working in a month
working_time(){
	# constant 
	local MAX_WORK_DAY=20
	local MAX_WORK_HR=100
	local emp_rate_pr_hr=20
	local full_time=1
	local part_time=0
	local total_salary=0
	local cur_day=1
	local cur_hr=0
	local emp_check=$((RANDOM%3))

	while (( cur_hr<MAX_WORK_HR && cur_day<MAX_WORK_DAY ))
	do
		case $emp_check in
			$full_time) empHrs=8;;
			$part_time) empHrs=4;;
			*) empHrs=0;;
		esac
		((cur_day++))
		cur_hr=$((empHrs+cur_hr))
		salary=$((empHrs*emp_rate_pr_hr))
		total_salary=$(($salary+$total_salary))
	done
	echo $cur_hr $cur_day
}

# function for get work hour limit
work_hour(){
	local time=$(working_time)
	echo $time

}

# function for store the dailly wage along with the total wage
store_wage(){
	local declare -A store
	local count=0
	local emp_rate_per_hr=20
	local full_time=1
	local part_time=0
	local emp_check=$((RANDOM%3))
	local total_salary=0
	local cur_day=1
	local cur_hr=0
	local MAX_WORK_DAYS=20
	local MAX_WORK_HR=100
	
	while (( cur_hr<MAX_WORK_HR && cur_day<MAX_WORK_DAY ))
	do
		case $emp_check in 
			$full_time) empHr=8;;
			$part_time) empHr=4;;
			*) empHr=0;;
		esac
		((cur_day++))
		cur_hr=$((empHr+cur_hr))
		salary=$((empHr*emp_rate_per_hr))
		total_salary=$(($total_salary + $salary))
		store[((count++))]="$salary $total_salary"
	done
	echo ${store[@]}

}

# It's for store the day and dailly wage along with the total wage
all_store(){
	local declare -A store
	local emp_rate_per_hr=20
	local full_time=1
	local part_time=0
	local total_salary=0
	local cur_day=1
	local cur_hr=0
	local MAX_WORK_DAY=20
	local MAX_WORK_HR=100
	local count=0
	local emp_check=$((RANDOM%3))
	
	while (( cur_hr<MAX_WORK_HR && cur_day<MAX_WORK_DAY ))
	do
		case $emp_check in 
			$full_time) empHr=8;;
			$part_time) empHr=4;;
			*) empHr=0;;
		esac
		((cur_day++))
		cur_hr=$((empHr+cur_hr))
		salary=$((empHr*emp_rate_per_hr))
		total_salary=$(($salary+$total_salary))
		store[((count++))]="$cur_day $salary $total_salary"
	done
	echo ${store[@]}
}
result="$(all_store)"
echo $result
