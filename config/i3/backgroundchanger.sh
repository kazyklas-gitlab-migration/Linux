#!/bin/bash


while ls > /dev/null ; do
   RAN=$(( ( RANDOM % 14 )  + 1 ))
	feh --bg-scale /home/tklas/Pictures/wall$RAN.jpg
	sleep 300
done
