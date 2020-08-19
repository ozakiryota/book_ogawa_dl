#!/bin/bash

image_name="book_pytorch_advanced"
tag_name="nvidia_docker1"

docker build . \
	-t $image_name:$tag_name
