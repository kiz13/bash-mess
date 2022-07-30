#!/usr/bin/env bash

# $(( <EXPRESSION> )) ; $[[ <EXPRESSION> ]]
# The arithmetic expression <EXPRESSION> is evaluated and expands to the result.

printf %s 'Enter a number: ' >&2
read -r number
if ((number == 1234)); then
  echo 'Good guess'
else
  echo 'Haha... :-P'
fi

# variables used inside the arithmetic expansion can be used without variable expansion
x=1
echo $((x))
echo $((x[0]))

i=1
echo $i $((i++)) $i
# => 1 1 2
