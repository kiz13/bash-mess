#!/usr/bin/env bash

# The tilde expansion is used to expand to several specific pathnames:
#    home directories
#    current working directory
#    previous working directory

# in case of a wrong username or any other error condition, the tilde construct is not replaced, it stays what it is

# ~ ; ~<NAME> expands to the home-directory of the current user or the given user
echo ~
# ~+ expands to the value of the PWD variable
echo "$PWD"
# ~- expands to the value of the OLDPWD variable (holds the previous working directory, the one before the last cd)
