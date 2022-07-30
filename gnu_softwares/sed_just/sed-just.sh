#!/usr/bin/env bash

# https://www.gnu.org/software/sed/manual/sed.html
# sed is a stream editor. A stream editor is used to perform basic text transformations on an input stream
# sed SCRIPT INPUTFILE...

# substitute
sed 's/hello/world/' input.txt > output.txt
# If you do not specify INPUTFILE, or if INPUTFILE is -, sed filters the contents of the standard input.
# The following commands are equivalent
sed 's/hello/world/' < input.txt > output.txt
cat < input.txt | sed 's/hello/world/' - > output.txt

# use -i to edit files in-place instead of printing to stdout
sed -i 's/hello/world/' file.txt

# Without -e or -f options, sed uses the first non-option parameter as the script, and the following non-option parameters as input files.
sed -e 's/hello/world/' input.txt > output.txt
sed --expression='s/hello/world/' input.txt > output.txt

echo 's/hello/world/' > myscript.sed
sed -f myscript.sed input.txt > output.txt
sed --file=myscript.sed input.txt > output.txt

################ sed script ################
# [addr]X[options]
# X is a single-letter sed command. [addr] is an optional line address.

# deletes lines 30 to 35 in the input;
sed '30,35d' input.txt > output.txt

# prints all input until a line starting with the word ‘foo’ is found.
# If such line is found, sed will terminate with exit status 42.
# If such line was not found (and no other error occurred), sed will exit with status 0.
# /^foo/ is a regular-expression address. q is the quit command. 42 is the command option.
sed '/^foo/q42' input.txt > output.txt

# Commands within a script or script-file can be separated by semicolons (;) or newlines (ASCII 10)
#sed '/^foo/d ; s/hello/world/' input.txt > output.txt
#
#sed -e '/^foo/d' -e 's/hello/world/' input.txt > output.txt
#
#echo '/^foo/d' > script.sed
#echo 's/hello/world/' >> script.sed
#sed -f script.sed input.txt > output.txt
#
#echo 's/hello/world/' > script2.sed
#sed -e '/^foo/d' -f script2.sed input.txt > output.txt

################ the s command ################
# the syntax is `s/regexp/replacement/flags`
# it attempts to match the pattern space against the supplied regexp;
# if the match is successful, then that portion of the pattern space which was matched is replaced with replacement.

################ often-used command ################
# seq [OPTION]... LAST
# seq [OPTION]... FIRST LAST
# seq [OPTION]... FIRST INCREMENT LAST

# stop after printing the second line
seq 3 | sed 2q
#
seq 3 | sed 2d
# `s` If auto-print is not disabled, print the pattern space, then, regardless, replace the pattern space with the next line of input.
# perform substitution on every 3rd line (i.e. two n commands skip two lines)
seq 6 | sed 'n;n;s/./x/'

# ...