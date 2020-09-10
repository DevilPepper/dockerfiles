#!/bin/bash

git fetch --depth=1 --update-shallow origin refs/tags/latest > /dev/null 2>&1

git diff FETCH_HEAD HEAD --name-only \
  | xargs dirname \
  | sort \
  | uniq \
  | grep -v '\.$' \
  | xargs -I{} sh -c 'test -f "$1/Dockerfile" && echo "$1"' sh {}
