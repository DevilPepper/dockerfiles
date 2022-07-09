#!/bin/bash

image_path=$1
image_name=$2

targets=$(grep "as test-" $image_path/Dockerfile | rev | cut -d- -f1 | rev)
for target in targets
do
  echo "Testing $image_name:$target"
  /usr/bin/docker buildx build $image_path --target test-$target
done
