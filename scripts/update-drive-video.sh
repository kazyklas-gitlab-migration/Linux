#!/bin/bash

set -eufo pipefail

if [ $# -ne 3 ]; then
    echo "Not a valid number of paremeters" 
    echo "bash update-drive-video.sh name wherefrom whereto" 
    exit 1
fi

# Define variables
NAME=$1
WHEREFROM=$2
WHERETO=$3

# shrink the video to 10 fps
ffmpeg -i "$2" -filter:v fps=10 /tmp/"$1"

# copy the video into the destiantion
if [ "$3" -eq "1" ]; then
	echo "Uploading KS"
	scp /tmp/$1 root@calculon.office.dtml:"/opt/videostreamer/opt/videostreamer/static/video/KnowledgeSharings/$NAME"
elif [ "$3" -eq "2" ]; then
	echo "Uploading DDLT"
	scp /tmp/$1 root@calculon.office.dtml:"/opt/videostreamer/opt/videostreamer/static/video/DDPLightingTalks/$NAME"
elif [ "$3" -eq "3" ]; then
	echo "Uploading WebDevLT"
	scp /tmp/$1 root@calculon.office.dtml:"/opt/videostreamer/opt/videostreamer/static/video/WebDevLightingTalks/$NAME"
elif [ "$3" -eq "4" ]; then
	echo "Uploading DSLT"
	scp /tmp/$1 root@calculon.office.dtml:"/opt/videostreamer/opt/videostreamer/static/video/DSLightingTalks/$NAME"
elif [ "$3" -eq "5" ]; then
	echo "Uploading DSRG"
	scp /tmp/$1 root@calculon.office.dtml:"/opt/videostreamer/opt/videostreamer/static/video/DatascienceReadingGroup/$NAME"
fi

echo "Video uploaded"

