#!/usr/bin/env bash

# The shell is responsible for interpreting and expanding globs ("filename wildcards")

#grep "changes:" ./*.log

# Normally, when no glob specified matches an existing filename,
# no pathname expansion is performed, and the globs are NOT removed.
shopt -s nullglob
echo "my little scheme file: " ./*.scm
# when the shell option `nullglob` is set, Bash will remove the entire glob from the command line.
