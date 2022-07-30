#!/usr/bin/env bash

# https://wiki.bash-hackers.org/syntax/expansion/proc_subst

# process substitution is a form of redirection where the input or output
# of a process (some sequence of commands) appear as a temporary file
# <( <LIST> ) ;  >( <LIST> )
# The command list <LIST> is executed and its
#   standard output fd in the <( ... ) form or
#   standard input fd in the >( ... ) form
# is replaced by a FIFO or a file in /dev/fd/. The filename (where the fd is connected) is then used as a substitution

# echo <(ls)

first_dir="expansion"
second_dir=".idea"
cd .. ; diff <(ls "$first_dir") <(ls "$second_dir")

# One of the most common uses for process substitutions is to avoid the final subshell that results from executing a pipeline.

counter=0
#find /etc -print0 | while IFS= read -rd '' _ ; do
#  ((counter++))
#done
#echo "$counter files"

while IFS= read -rN1 _ ; do
  ((counter++))
done < <(find /etc -printf ' ')
echo "$counter files"

f() {
  cat "$1" > "$x"
}
x=>(tr '[:lower:]' '[:upper:]') f <(echo 'hi there')
