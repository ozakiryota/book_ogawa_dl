#!/bin/bash

xhost +

image="book_pytorch_advanced"
tag="latest"

docker run -it --rm \
	-e "DISPLAY" \
	-v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--gpus all \
	-p 8000:8000 \
	$image:$tag