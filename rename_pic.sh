#!/usr/bin/env bash

show_jpg() {
  for filename in ./* ; do
    if [[ ${filename##*.} == "sh" ]] ; then
      continue;
    fi
  #  echo "${filename}"
    mv "${filename}" "${filename}.jpg"
  done
}

show_origin() {
  for filename in ./* ; do
    if [[ ${filename##*.} == "sh" ]] ; then
      continue;
    fi
    mv "${filename}" "${filename%.*}"
  done
}
