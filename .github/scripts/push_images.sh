#!/bin/bash

image_path=$1
image_name=$2
sha=$3
version=$4

targets=$(grep "as build-" $image_path/Dockerfile | rev | cut -d- -f1 | rev | grep -v base)
for target in targets
do
  echo "Building $image_name:$target"
  /usr/bin/docker buildx build $image_path --target build-$target --push \
    --tag $image_name:$target \
    --tag $image_name:$target-$sha \
    --tag $image_name:$target-$version \
    --tag ghcr.io/$image_name:$target \
    --tag ghcr.io/$image_name:$target-$sha \
    --tag ghcr.io/$image_name:$target-$version
done
