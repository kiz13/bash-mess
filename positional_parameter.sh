#!/usr/bin/env bash

# https://wiki.bash-hackers.org/scripting/posparams#mass_usage

## special parameters ##
# $0	          the first positional parameter
# $FUNCNAME	    the function name (attention: inside a function, $0 is still the $0 of the shell, not the function name)
# $1...$9	      the argument list elements from 1 to 9
# ${10}...${N}  the argument list elements beyond 9
# $*	          all positional parameters except $0
# $@	          all positional parameters except $0
# $#            the number of arguments, not counting $0

# outputs the name the script is called with;
# but `/usr/bin/bash` in login shells
echo "$0"
# In other terms, $0 is not a positional parameter, it's a special parameter
# independent from the positional parameter list. It can be set to anything...

# the builtin command `shift` is used to change the positional parameter values
# in general, $N will become $N-1
#for (( i = 0; i < $#; i++ ))
#do
#  shift ; echo "$i"
#done

# another way to iterate one argument at a time
for arg
do
  echo "$arg"
done

# mass usage
# $* and $@  -->  $1 $2 ... $N
# "$*"   -->  "$1c$2c...c$N"
# "$@"   -->  "$1" "$2" ... "$N"

# When the $* is double quoted, it expands to the equivalent of ..., where 'c' is the first character of *IFS*
# When the $@ is double quoted, it expands to all positional parameters as they were set initially and passed to the script or function.
# You almost always want a quoted "$@"

echo;echo
# range of positional parameters
# ${@:START[:COUNT]}
# ...
# If START is negative, the positional parameters are numbered in reverse starting with the last one.
echo "${@: -2}"
echo "${@:1:3}"
# As of Bash 4, a START of 0 includes the special parameter $0. Bash 3 and older, both 0 and 1 began at $1

# examples
accept_options() {
  while :
  do
    case "$1" in
      -f | --file)
        file="$2"
        shift 2
        ;;
      -h | --help)
        display_help
        exit 0
        ;;
      -u | --user)
        username="$2"
        shift 2
        ;;
      -v | --verbose)
        verbose="verbose"
        shift
        ;;
      *)
        break
        ;;
    esac
  done
}

display_help() {
  echo "Remember no one will ..."
}

