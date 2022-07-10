#!/bin/bash

for image in $(ls images)
do
  if [ -z "$(git show --first-parent --name-only -- images/$image)" ]
  then
    include=false
  else
    include=true
  fi

  echo "$images changed: $include"

  if $include
  then
    echo "Putting it in the list!"
    # bc GitHub Actions can't do this...
    jq -Mc \
      --arg     image      "$image" \
      '. | .image=$image' \
      <<<'{}'
  fi
done
