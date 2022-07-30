#!/usr/bin/env bash

# http://www.greenwoodsoftware.com/less/

less -M ./*.md  # --long-prompt, set prompt style

file ./* | less  # easier file analysis

# less -p pattern filename
less -I -p case ./less-just.sh  # --IGNORE-CASE, ignore case in all searches

# once inside less, use `/` followed by the pattern to do interactive searching