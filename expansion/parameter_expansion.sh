#!/usr/bin/env bash

# https://wiki.bash-hackers.org/syntax/pe

word="bicycle"
echo "The plural of $word is ${word}s"
echo "argument 1 is: $1"
echo "argument 10 is: ${10}"

## ------------ indirection ------------ ##
# if the param PARAMETER has the value "TEMP", then ${!PARAMETER} will expand to the value of the param named TEMP, i.e., ${TEMP}
read -rep 'Which variable do you want to inspect? ' look_var
printf 'The value of "%s" is: "%s"\n' "$look_var" "${!look_var}"

# fake positional params
set one two three four
# the '#' stores the number of arguments, so '!#' will reference the LAST argument
echo ${#} ; echo ${!#}

## ------------ case modification  ${PARAM,,} ------------ ##
# ^ make the first character uppercase
# , make the first character lowercase
# ~ reverse the first character's case
# the double-forms apply the rule to all characters
cat="Cat Dog"
echo "${cat^}"
echo "${cat^^}"
echo "${cat,}"
echo "${cat,,}"
echo "${cat~}"
echo "${cat~~}"
# the rules apply to every expanded element
my_arr=(This is Some Text)
echo "${my_arr[@],}"

## ------------ variable name expansion ------------ ##
# ${!PREFIX@} ; ${!PREFIX*}
# This expands to a list of all set variable names beginning with the string PREFIX.
# The elements of the list are separated by the first character in the IFS
echo "${!BASH@}"

## ------------ Substring removal ------------ ##
# ${PARAM#PATTERN}, ${PARAM##PATTERN} match from the beginning of the string
# ${PARAM%PATTERN}, ${PARAM%%PATTERN} match from the end
# expand only a part of a param's value, give a pattern to describe what to remove from the string

# the operator "#" will try to remove the shortest text matching the pattern,
# while "##" tries to do it with the longest one
my_string="Feels with me"
echo "${my_string#* }"   # "with me"
echo "${my_string##* }"  # "me"
# ...
echo "${my_string% *}"   # "Feels with"
echo "${my_string%% *}"  # "Feels"

# common use
# get name without extension
# ${filename%.*}
# Get extension
# ${filename##*.}
# Get directory name
# ${pathname%/*}
# Get filename
# ${pathname##*/}

# As for most parameter expansion features, working on arrays will handle each expanded element
my_arr2=(This is a text)
echo "${my_arr[@]%is}"

## ------------ Search and replace ------------ ##
# ${PARAM/PATTERN/STRING}
# ${PARAM//PATTERN/STRING}
# ${PARAM/PATTERN}
# ${PARAM//PATTERN}
# substitute (replace) a substring matched by a pattern, on expansion time.

# with one slash to only substitute the first occurrence of the given pattern
# ... two slashes .. all occurrences

my_string2="Be liberal in what you accept, and conservative in what you send"
echo "${my_string2/in/by}"
echo "${my_string2//in/by}"

# anchoring, hash indicates the expr is matched against the beginning portion of the string, ...
my_string3="xxx"
echo "${my_string3/#x/y}"
echo "${my_string3/%x/y}"

# is the replacement part is completely omitted, the matches are replaced by the nullstring, i.e., they are removed.

# applies to ...

## ------------ String length ------------ ##
# ${#PARAM}   the length of the PARAM's value is expanded.

## ------------ Substring expansion ------------ ##
# ${PARAM:OFFSET}
# ${PARAM:OFFSET:LENGTH}
# obtain only a part of a parameter's value
echo "${my_string2:13}"
echo "${my_string2:13:5}"
echo "${my_string2: -13:5}"
echo "${my_string2:(-13):5}"
# If the LENGTH value is negative, it's used as offset from the end of the string.
echo "${my_string2:(-23):-5}"  # since Bash 4.2-alpha

# for arrays, this expansion type has 2 meanings:
#   For individual elements, it expands to the specified substring (as for every "normal" parameter)
#   For the mass subscripts @ and * it mass-expands individual array elements denoted by the 2 numbers given (starting element, number of elements)
my_arr3=(that is a cat)
echo "${my_arr3[0]:1:2}"
echo "${my_arr3[@]:1:2}"

## ------------ Use a default value ------------ ##
# ${PARAM:-WORD}
# ${PARAM-WORD}
# If the PARAM is unset or null (empty), this one expands to WORD
echo "Your home directory is: ${HOME:-/home/$USER}"

read -p "Enter your gender (just press ENTER to not tell us): " GENDER
echo "Your gender is ${GENDER:-a secret}"

array=("")
echo "${array[@]:-This array is NULL or unset}"

## ------------ ... ------------ ##

## Assign a default value
# ${PARAM:=WORD}
# ${PARAM=WORD}
# for array, the mass-expansion subscripts @ and * can't be used here because it's not possible to assign to them

## use an alternate value
# ${PARAM:+WORD}
# ${PARAM+WORD}
# This form expands to nothing if the parameter is unset or empty.
# If it is set, it does not expand to the parameter's value, but to some text you can specify
echo "The Java application was installed and can be started.${JAVAPATH:+ NOTE: JAVAPATH seems to be set}"

## display error if null or unset
# ${PARAM:?WORD}
# ${PARAM?WORD}
# if the PARAM is set/non-null, this form will simply expand it.
# Otherwise, the expansion of WORD will be used as appendix for an error message
echo "The unset parameter is: ${p_unset?not set}"

## ------------ special parameters ------------ ##
# $? expands to the exit code of the most recently completed foreground command.
# $$ expands to the PID of the current shell.
# $! expands to the PID of the command most recently executed in the background.
# "$_" double quoted, expands to the last argument of the last command that was executed.
