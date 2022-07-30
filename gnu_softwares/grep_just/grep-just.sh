#!/usr/bin/env sh

# https://www.gnu.org/software/grep/manual/grep.html#Usage
# grep [option...] [patterns] [file...]
# Just like `cat`, `grep` also uses `stdin` if you don't specify any files.

# TODO https://www.gnu.org/software/grep/manual/grep.html#Regular-Expressions

# ignore case
grep -i 'hello.*world' menu.txt main.txt

# the `-n (--line-number)` print line number with output lines
# the -- argument treats any later arguments starting with '-' as file names not options.
# the empty file /dev/null causes file names to be output even if only one file name happens to be of the form '*.g.*h'
grep -n -- 'f.*\.c$' *g.*.h /dev/null

# list just the names of matching files
grep -l 'main' test-*.c

# search directories recursively
grep -r 'hello' /home/gigi
# with more control, use find and grep
# `-H (--with-filename)` print file name with output lines
find /home/gigi -name '*.c' ! -type d -exec grep -H 'hello' '{}' +
# similar to
# `--include=FILE_PATTERN`, search only files that match the pattern
grep -r --include='*.c' 'hello' /home/gigi

# searches for all lines matching '--cut here--'.
# Without --, grep would attempt to parse '--cut here--' as a list of options
grep -- '--cut here--' ./*
# `-e (--regexp=PATTERN)` use PATTERN for matching
grep -e '--cut here--' ./*

# `-w (--word-regexp)` force PATTERN to match only whole words
grep -w 'hello' test*.log
# for more control
grep '\<hello\>' test*.log

# output context around the matching lines
# `-C (--count)` print only a count of selected lines per FILE
grep -C 2 'hello' test*.log

# append /dev/null to force grep to print the name of the file
grep 'eli' /etc/passwd /dev/null
# or just use -H, which is a GNU extension

# if grep listed all matching "lines" from a binary file, it would probably
# generate output that is not useful.
# to force grep to output lines even from files that appear to be binary
# use the -a or 'binary-files=text' option

# finds all lines that contain both 'paul' and 'franc,ois'
grep 'paul' /etc/motd | grep 'franc,ois'
