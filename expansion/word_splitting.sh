#!/usr/bin/env bash

# Word splitting occurs once any of the following expansions are done
#   parameter expansion, command expansion, arithmetic expansion
# it is not performed on expansions in assignments.
# it is performed on the results of almost all *unquoted* expansions
# The result of the expansion is broken into separate words based on the characters of the IFS variable.
# If IFS is not set, then it will be performed as if IFS contained a space, a tab, and a newline.

#set hello world "how are you"
# => 3 args: <hello> <world> <how are you>

#var="This is a variable"
#set $var
# => 4 args: <This> <is> <a> <variable>

#log=/var/log/qmail/current
#IFS=/
#set $log
# => 5 args: <> <var> <log> <qmail> <current>
# non-whitespace IFS characters are not ignored at the beginning and end of expansions

#ls_out=$(ls -l)
#set $ls_out

#array=(testing, testing, "1 2 3")
#set "${array[@]}"
# 3 args: <testing,> <testing,> <1 2 3>

# bc pathname expansion happens after word splitting, it can produce some very shocking results
#what=qmaild:*:994:998::/var/qmail:/sbin/nologin
#IFS=:
#set $what
#echo *

# though it can be used for good if you're very careful
#files='*.mp3 *.ogg'
#set $files

printf "%d args:" "$#"
printf " <%s>" "$@"
