#!/usr/bin/env bash

# https://wiki.bash-hackers.org/syntax/expansion/brace
# {string1,string2,...,stringN}
#
# {<START>..<END>}
# {<START>..<END>..<INCR>} (Bash 4)
#
# <PREFIX>{........}
# {........}<SUFFIX>
# <PREFIX>{........}<SUFFIX>

# The specified strings are used to generate all possible combinations with the optional surrounding prefixes and suffixes

echo {a,b}"$HOME"
# the brace expansion *does not expand the variable*, it just makes it being:
# echo a$PATH b$PATH

a=1 ; b=5
#echo {"$a".."$b"}
# it won't work as:
#echo {1..5}

# if you really can't handle this in another way, use the `eval` command
#eval echo {"$a".."$b"}
eval echo "{$a..$b}"

# The brace expansion is only performed if the given string list is really a list of strings,
# i.e., if there is a minimum of one ","
echo {alone,}

# A "sequence expression" can be of two types:
#    integers  (optionally zero padded, optionally with a given increment)
#    characters
echo {01..13}

# combining and nesting
echo {a..c}{1..3}
echo {{A..Z},{a..z}}

# ------------ common use and examples ------------ #

#wget https://docs.example.com/documentation/slides_part{1,6}.html

#mkdir ./temp/{foo,bar,cat,dog}

#for i in 0{1..9} 10 ; do printf "%s\n" "$i" ; done

#printf "%s\n" img{00{1..9},0{10..99},{100..999}}.png

# repeating arguments or words
echo v{,,,,,}

# ------------ new in Bash 4.0 ------------ #

# Prefix either of the numbers with 0 to pad the expanded numbers with the correct amount of zeros
echo {001..10}
echo {1..010}

echo {10..1..2}
# The increment specification also works for letter-ranges
echo {a..h..2}
