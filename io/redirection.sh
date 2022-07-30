#!/usr/bin/env bash

# Redirection is used to change the data source or destination of a program's FDs
# Redirections are performed by BASH, before the shell runs the command to which the redirections are applied
# The redirection applies only to one command

# &N  references the current target/source of the FD N
# &-  closes the redirected FD, useful instead of `> /dev/null`

echo "It was a dark and stormy night. Too dark to write." > story
# The > operator begins an output redirection.
# By default, Bash doesn't check to see whether that file exists first;
# it just opens the file, and if there was already a file by that name, its former contents are lost.
# If the file doesn't exist, it is created as an empty file. This behavior can be toggled with shell options.

# modifies cat's stdin so that its data source is the file
cat < story ; rm story
# here, cat opened an FD to the file story and read its contents through that FD
#cat story

# command 1> file: Send the stdout of command to file. You can omit the `1` bc FD 1 is the default for the > operator
# command 0< file: Use the contents of file when command reads from stdin ...

for dir in ./*
do rm "${dir}/secret"
done 2> errors
# here, the redirection (on the `done` thing) applies to all output to stderr made inside the loop.
# BASH opens the file named errors and points stderr to it before the loop begins,
# then closes it when the loop ends. Any commands run inside the loop (such as rm) inherit the open FD from BASH.

cat < errors ; rm errors

# ... 2> /dev/null
# The file `/dev/null` is always empty. When we write something (e.g. error messages) to it, they just disappear.
# It's not a normal file; it's a _virtual device_. Some people call `/dev/null` the _bit bucket_.

# ... 2>> errors # it will not empty the file; it just append new data to the end of it

echo "I am a very proud sentence with a lot of words in it, all for you." > file
grep proud file 'not a file' > proud.log 2> proud.log
# FD 1 pointed to proud.log,
# FD 2 also pointed to this same file, and specifically, pointed to the *beginning* of this file.

# we can prevent having two independent FDs working on the same destination or source by *duplicating* FDs
grep proud file 'not a file' > proud.log 2>&1
# we use the >& syntax to duplicate FD 1 and put this duplicate in FD 2.

# grep proud file 'not a file' 2>&1 > proud.log
# This will duplicate stderr to where stdout points (which is the terminal),
# and then stdout will be redirected to proud.log. As a result,
# stdout's messages will be logged, but the error messages will still go to the terminal.

# the shorthand version, which redirecting both stdout and stderr to a file
# it is not portable to BourneShell
grep proud file 'not a file' &> proud.log

rm proud.log file

## ------------ Heredocs and Herestrings ------------ ##
# Sometimes storing data in a file is overkill. We might only have a tiny bit of it.

# here, the EOF is chosen as a sentinel; the lines that follow the first
# sentinel, up to the second one, become the stdin for the command
grep proud <<EOF
I am a proud sentence.
EOF
# any spaces you use for indenting your script will appear in the stdin.

# The most common use of Heredocs is dumping documentation to the user
usage() {
  cat <<EOF
usage: foobar [-x] [-v] [-z] [file ...]
A short explanation of the operation goes here.
It might be a few lines long, but shouldn't be excessive.
EOF
}

# Herestring
grep proud <<<"I am a proud sentence."

# --tagged-paragraph; --width maximum line width
fmt -t -w 13 <<<'wrap this sentence'
