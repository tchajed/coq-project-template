#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cp "$DIR/Makefile" ./

mkdir -p src vendor
if [ ! -e 'vendor/.gitignore' ]; then
  cp "$DIR/vendor/.gitignore" vendor/
fi

if [ ! -e '.gitignore' ]; then
  cp "$DIR/.gitignore" ./
fi

if [ ! -e 'libname' ]; then
  dirname=$(basename "$PWD")
  # adapted from https://unix.stackexchange.com/questions/196239/convert-underscore-to-pascalcase-ie-uppercamelcase
  # TODO: fix this to check for GNU sed first
  echo "$dirname" | gsed -r 's/(coq)?(^|-)([a-z])/\U\3/g' > libname
fi
