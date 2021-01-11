#!/bin/bash -x

#constant
IS_PRESENT=1
EMP_RATE_PER_HR=20
FULL_TIME=8

#variable
empCheck=$(( RANDOM%2 ))
dailyWage=0

if [ $empCheck -eq $IS_PRESENT ]
then
	echo "Employee is present"
	dailyWage=$(( $EMP_RATE_PER_HR*$FULL_TIME ))
else
	echo "Employee is absent"
fi
