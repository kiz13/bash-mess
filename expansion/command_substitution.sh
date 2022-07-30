#!/usr/bin/env bash

# ` <COMMAND> ` more or less obsolete for Bash
# $( <COMMAND> )
# it expands to the output of commands. These commands are executed in a subshell.
# and their stdout data is what the substitution syntax expands to.

# All trailing newlines are removed

# When the inner command is only an input redirection
# $( <FILE )
# then Bash attempts to read the given file and act just if the given command was `cat FILE`

# No special escaping of nothing is needed
echo "$(echo "$(ls)")"

echo "$(
# some comment ending with a (
ls
)"

DATE="$(date)"

# you need to redirect cp STDERR to its STDOUT target
# because command substitution only catches STDOUT
#COPY_OUTPUT="$(cp file.txt /some/where 2>&1)"
