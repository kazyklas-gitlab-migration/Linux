#!/bin/bash

if [ "$1" =  "max" ]; then
    echo "20000" > /sys/class/backlight/intel_backlight/brightness

elif [ "$1" = "min" ]; then
    echo "1000" > /sys/class/backlight/intel_backlight/brightness

elif [ "$1" = "inc" ];then
    CURRENT=$(cat /sys/class/backlight/intel_backlight/brightness)
    BRIGHTNESS=$(( $CURRENT + 1000 ))
    echo "$BRIGHTNESS" > /sys/class/backlight/intel_backlight/brightness

elif [ "$1" = "dec" ];then
    CURRENT=$(cat /sys/class/backlight/intel_backlight/brightness)
    BRIGHTNESS=$(( $CURRENT - 1000 ))
    echo "$BRIGHTNESS" > /sys/class/backlight/intel_backlight/brightness
fi
