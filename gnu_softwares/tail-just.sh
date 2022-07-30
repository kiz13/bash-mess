#!/usr/bin/env bash

# https://www.gnu.org/software/coreutils/manual/html_node/tail-invocation.html
# `tail [option]... [file]...` prints the last part (10 lines by default) of each file

# If more than one file is specified, tail prints a one-line header before the output for each file, consisting of:
# `==> file name <==`

# `-n [+]num` or `--lines=[+]`
# Output the last num lines. However, if num is prefixed with a ‘+’, start printing with line num from the start of each file, instead of from the end.

# `-q`, `--quite` or `--silence` never print file name headers
# `-v` or `--verbose` always print file name headers

# For further processing of tail output, it can be useful to convert the file headers to line prefixes
#tail --lines=5 notes.md package.json |
#awk '
#  /^==> .* <==$/ {prefix=substr($0,5,length-8)":"; next}
#  {print prefix$0}
#'
