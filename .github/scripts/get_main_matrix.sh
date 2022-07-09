#!/bin/bash

for image in $(ls images)
do
  if [ -z "$(git show --first-parent --name-only -- images/$image)" ]
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
      --argjson include    "$include" \
      '. | .image=$image | .include=$include' \
      <<<'{}'
  fi
done
