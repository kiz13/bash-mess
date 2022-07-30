#!/usr/bin/env sh

# https://www.gnu.org/software/coreutils/manual/html_node/Translating.html

# `tr [OPTION]... SET1 [SET2]`
#
# It performs translation when `-d (--delete)` is not given and both SET1 and SET2 appear.
# `-t (--truncate-set1)` may be used only when translating.
#
# it translates each character of its input that is in SET1 to the corresponding character in SET2
#   characters not in SET1 are passed though unchanged
# when a character appears more than once in SET and the corresponding characters
#   in SET2 are not all the same, only the final one is used.

#tr aaa xyz
# is equivalent to
#tr a z

# a common use of tr is to convert lowercase characters to uppercase
#tr a-z A-z  # not portable
tr '[:lower:]' '[:upper:]'

# When tr is performing translation, set1 and set2 typically have the same length.
# If set1 is shorter than set2, the extra characters at the end of set2 are ignored.
