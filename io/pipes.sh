#!/usr/bin/env bash

# | creates a special file, a pipe, which is opened as a write destination for the left command,
# and as a read source for the right command.

# N.b. The pipe operator creates a subshell environment for each command
echo
message=Test
echo 'Salut, le monde!' | read -r message
echo "The message is $message"
echo 'Salut, le monde!' | {
    read -r message; echo "The message is (inside the subshell): $message";
  }
echo "The message is $message"

#head -n 1 .dir > file1
#tail -n 1 .dir > file2
#diff -y file1 file2 ; rm file1 file2
# one-liner
#diff -y <(head -n 1 .dir > file1) <(tail -n 1 .dir > file2)
# With the <() operator, the command's output is put in a named pipe (or something similar)
# that's created by bash. The operator itself in your command is replaced by the filename of that file.

# with >(...), we redirect the file to the command's input.
# It's used for cases where you're running a command that writes to a file,
# but you want it to write to another command instead:
#tar -cf >(ssh host tar xf -) .