#!/usr/bin/env bash

# https://www.gnu.org/software/gawk/manual/gawk.html
# The basic function of awk is to search files for lines (or other units of text) that
# contain certain patterns. When a line matches one of the patterns, awk performs specified actions on that line.

# awk 'program' input-file1 input-file2...

# When the program is long, it is usually more convenient to put it in a file
# awk -f program-file input-file1 input-file2...

# when run awk without any input files
# awk 'program'
# awk applies the program to the stdin, which usually means whatever u type on the keyboard.
# This continues until u indicate end-of-file by typing Ctrl-d.

awk -f advice

# searches the input file mail-list for the character string ‘li’
# When lines containing ‘li’ are found, they are printed because
# 'print $0' means print the current line. (Just 'print' by itself means the same thing, so we could have written that instead.)
awk '/li/ { print $0 }' mail-list

# print every line that is longer than 80 characters
awk 'length($0) > 80' data
# print the length of the longest input line
awk '{ if (length($0) > max) max = length($0) } END { print max }' data

echo a b c a b c | awk '{print gensub(/a/, "AA", 2) }'
# outputs a b c AA b c

# ...
