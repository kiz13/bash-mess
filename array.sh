#!/usr/bin/env bash

# Bash supports two different types of ksh-like one-dimensional arrays.
# Multidimensional arrays are NOT implemented:
#    1. Indexed arrays use positive integer numbers (start at 0) as keys. Indexed arrays
#       are always sparse, meaning indexes are not necessarily contiguous.
#    2. Associative arrays (sometimes known as a "hash" or "dict") use arbitrary nonempty strings as keys.
#       They are always unordered. (Bash 4)

# The overall syntax for referring to array variables is arrname[subscript] -
# where for indexed arrays, subscript is any valid arithmetic expression, and for associative arrays, any nonempty string.

# the special subscripts `*` and `@` are also accepted which act upon arrays
# analogously to the way they act upon the positional parameters

# An array is a Bash parameter that has been given the -a (for indexed) or -A (for associative) attributes.

x=hi
printf "%s " "$x" "${x[0]}"
echo "${_[0]}"

# ARRAY=()   Declares an indexed array ARRAY and initializes it to be empty. This can also be used to empty an existing array.
# ARRAY[0]=   Generally sets the first element of an indexed array. If no array ARRAY existed before, it is created.
# declare -a ARRAY   Declares an indexed array ARRAY. An existing array is not initialized.
# declare -A ARRAY   This is the one and only way to create associative arrays.
declare -a names=('Peter' 'Anna' 'Greg' 'Jan')

# ARRAY=([U1]=e1 [U2]=e2 ...)     compound assignment for either indexed array or associative array
# ARRAY+=(e1 e2 ...)              append to ARRAY
# ARRAY=("${ANOTHER_ARRAY[@]}")   copy

# "${ARRAY[@]}", ${ARRAY[@]:N:M} ...

## metadata
# ${#ARRAY[U]}    expands to the length of an individual array element at where (stringlength)
# ${#ARRAY[@]}    expands to the number of elements in ARRAY
# ${!ARRAY[@]}    expands to the indexes in ARRAY since BASH 3.0
# ...

## destruction
# unset -v ARRAY    destroys a complete array
# unset -v ARRAY[U]    destroys the array element at where

## Specifying unquoted array elements as arguments to any command may cause pathname expansion to occur due to the presence of glob characters

# ...