#!/bin/bash
# A small Bash script to set up User LED3 to be turned on or off from 
#  Linux console. Written by Derek Molloy (derekmolloy.ie) for the 
#  book Exploring BeagleBone. Modified by Cameron Burnham, 2/27/25
#  Modified to blink n times, with two arguments:
# (arg1) = "blink" to turn the LED on and off.
# (arg2) = integer, number of times to blink the LED.

LED3_PATH=/sys/class/leds/beaglebone:green:usr3

del=0.5

function blink
{
	echo "1" >> "$LED3_PATH/brightness"
	sleep "$del"
	echo "0" >> "$LED3_PATH/brightness"
	sleep "$del"
}

echo "Starting the LED Bash Script"
if [ $# -ne 2 ]; then
  echo "Incorrect number of arguments. Usage is:"
  echo -e " bashLED [command] [n times] \n  where command is"
  echo -e " blink \n and n times is"
  echo -e "integer, number of times to blink\n"
  exit 2
fi

echo "The LED Command that was passed is: $1"
if [ "$1" == "blink" ]; then
	echo -e "Blinking the LED $2 times."

	for (( i=0; i<$2; i++ ))
	do
		blink
	done
fi
echo "End of the LED Bash Script"
