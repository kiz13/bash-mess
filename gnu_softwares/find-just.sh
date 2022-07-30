#!/usr/bin/env bash

# with a simple `find` (implicit `-print` action), it lists every folder and files recursively in the current directory (default path);
# `find app` specify a path (`./app`) to find items in.

# Tests (filters):
#   `-type`, `find -type d` selects directories, `... f` selects files
#   `-name` takes a glob, e.g., `"*.md"`;
#   the `-iname` variant is case insensitive.

# ------ Combining test operator ------ #
# a test returns true if it matches the current file. every operator only applies to the next expression.

find -name "*.js" -type f  # (default to `-and`)

find -name "*.js" -or -name "*.css" -type f

find -not -name "*.js" -type f

# ------ Grouping ------ #
find \( -name "*.js" -type f \) -or -type d

# N.b., escape the brackets in bash, also the white space

# ------ Actions ------ #
# `-print` default action;

find -name "*.~" -delete  # delete every temporary file create by vim

# `-mindepth levels`
# `-maxdepth levels` descend at most levels (non-negative integer) of directories ...
# `-depth` makes `find` list folders' content before itself ... (`-delete` implies `-depth`)
# `-prune` prevent `find` from going into a directory that matches some tests.

find -not \( -name "node_modules" -prune \) -name "*.wtf"
find -not \( -path ./ch01 -prune \) -not \( -path ./ch03 -prune \) -name "*.wtf"

# https://math2001.github.io/article/bashs-find-command/
