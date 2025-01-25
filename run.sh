#!/bin/bash

# Modified from IsaacGym Preview 4's script (https://developer.nvidia.com/isaac-gym).

set -e
set -u

if [ $# -eq 0 ]
then
    echo "running docker without display"
    docker run -it --network=host --gpus=all --name=isaacgym_container isaacgym /bin/bash
else
    export DISPLAY=$DISPLAY
	echo "setting display to $DISPLAY"
	xhost +
	docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v <WORKSPACE PATH ON YOUR HOST>:<WORKSPACE PATH ON YOUR CONTAINER> -e DISPLAY=$DISPLAY --network host --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 --name=isaacgym_container isaacgym /bin/bash
	xhost -
fi
