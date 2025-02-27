#!/bin/bash
#  Script to blink the onboard LED3 on the BBB n times
#  Written by Cameron Burnham, 2/27/2025
#  Modified to blink n times, with two arguments:
# (arg1) = "blink" to turn the LED on and off.
# (arg2) = integer, number of times to blink the LED.
# Example invocation: ./led-hw4.sh flash 5
# The above example would blink the LED five times.

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
