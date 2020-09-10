#!/bin/bash

changed_files=$(./get_changed_images.sh)

for file in $changed_files
do
  name=${file%%/*}
  prefix=${file#*/}
  if [ $prefix != $name ]; then
    prefix="$(echo $prefix | tr / _)-"
  else
    prefix=''
  fi
  version=$(grep -v '^#' $file/Dockerfile | head -n 1 | cut -d':' -f2)
  jq -Mc \
     --arg path    "$file" \
     --arg name    "$name" \
     --arg prefix  "$prefix" \
     --arg version "$version" \
     '. | .path=$path | .name=$name | .version=$version | .prefix=$prefix' \
    <<<'{}'
done
