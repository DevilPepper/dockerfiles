#!/bin/bash

for image in $(ls images)
do
  if [ -z "$(git diff main HEAD --name-only -- images/$image)" ]
  then
    include=false
  else
    include=true
  fi

  if $include
  then
    # bc GitHub Actions can't do this...
    jq -Mc \
      --arg     image      "$image" \
      '. | .image=$image' \
      <<<'{}'
  fi
done
