#!/usr/bin/env bash

# find /path -name pattern -print | xargs command
find . -maxdepth 1 -name '*.sh' -print0 | xargs -0 grep -H 'usr'

# echo "*.{js,json}"  # brace expansion

# find . -not \( -name "node_modules" -prune \) -name 'webpack.*' -print0 | xargs -0 grep -H -n 'presets'

# remove all node_modules from your computer
# find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
