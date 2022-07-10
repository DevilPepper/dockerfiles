#!/bin/bash

for image in $(ls images)
do
  git fetch origin main --depth=1
  if [ -z "$(git diff FETCH_HEAD HEAD --name-only -- images/$image)" ]
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
