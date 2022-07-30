#!/usr/bin/env bash

# --------- subshell --------- #
# Subshells are created implicitly for each command in a pipeline.
# They are also created explicitly by using parentheses around a command
(cd io || exit 1; date)
pwd

if [[ ! -f $CONFIGFILE ]]; then
  echo "Config file $CONFIGFILE not found" >&2
  exit 1
fi