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
scp /tmp/$1 root@calculon.office.dtml:"$WHERETO/$NAME"

echo "Video uploaded"

cat << EOF 
Hi,

the video is uploaded and can be found on:
http://stream.dtml/video$WHERETO/$NAME

Have a nice day,
Tomas Klas
EOF
