#! /bin/bash
# This program spins the screen
while [ true ] # runs forever
do
	xrandr -o left # rotates the display so left is up
	sleep 5 # wait for 1 seconds
	xrandr -o inverted # rotates the display so its upside down
	sleep 5 # wait for 1 seconds
	xrandr -o right # rotates the display so right is up
	sleep 5 # wait for 1 seconds
	xrandr -o normal # rotates the display so its normal
	sleep 5 # wait for 1 seconds
done
