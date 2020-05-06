#!/bin/bash

i3status --config /home/tomas/.config/i3/i3status.conf | while :
do
        read line
		  TEMP=$(sensors | grep Pack | cut -d"+" -f2 | cut -d" " -f1)

       echo "CPU: $TEMP | $line" || exit 1
done
