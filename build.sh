#!/bin/bash

image_name="book_pytorch_advanced"
tag_name="latest"

docker build . \
	-t $image_name:$tag_name