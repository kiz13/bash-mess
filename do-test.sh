#!/usr/bin/env bash

#str="some something"
#echo "${str/some/no}"
#echo "${str/some}"

# (( <EXPRESSION> ))
# Unlike command exit and return codes, arithmetic expressions evaluate to logical "true" when they are not 0
# basically is equivalent to what the let builtin command does, but prefer this

measure_file_size() {
  filename="$1"
  filesize=$(wc -c < "$filename")
  # GNU stat, non standard?
  #filesize=$(stat -c%s "$filename")
  filesize_in_kb=$((filesize / 1024))
  echo "size of ${filename} is ${filesize} bytes, around ${filesize_in_kb} kb."
}

checkAvailability() {
  my_needed_commands="sed awk ssh kill lsof wget"
  missing_counter=0
  for cmd in $my_needed_commands ; do
    if ! command -v "$cmd" &> /dev/null; then
      printf "Command not found in PATH: %s\n" "$cmd"
      ((missing_counter++))
    fi
  done

  if ((missing_counter > 0)); then
    printf "Minimum %d commands are missing in PATH, aborting\n" "$missing_counter" >&2
    exit 1
  fi
}

command -v lsof &> /dev/null || {
  echo >&2 "lsof not found in PATH" ; echo $?
}

type lsof > /dev/null 2>&1 || {
  echo >&2 "lsof not found in PATH" ; echo $?
}

if ! hash lsof; then
  echo $?
fi

command -v rsync &> /dev/null || echo >&2 "rsync not found"

#open() {
#  case "$1" in
#    *.mp3|*.ogg|*.wav|*.flac|*.wma) xmms "$1";;
#    *.jpg|*.gif|*.png|*.bmp)        display "$1";;
#    *.avi|*.mpg|*.mp4|*.wmv)        mplayer "$1";;
#  esac
#}
#for file; do
#  open "$file"
#done
