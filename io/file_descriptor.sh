#!/usr/bin/env bash

# http://mywiki.wooledge.org/BashGuide/InputAndOutput

# File Descriptors (in short: FDs) are the way programs refer to files,
# or to other resources that work like files (such as pipes, devices, sockets, or terminals).
# FDs are kind of like pointers to sources of data, or places data can be written.

# By default, every new process starts with three open FDs:
#   Standard Input (stdin): FD 0
#   (stdout): FD 1
#   (stderr): FD 2
# In shell scripts, FDs are always referenced by number.

# As a convention, you should send your custom error messages to the stderr FD.
echo "Uh oh. Something went really bad.." >&2
