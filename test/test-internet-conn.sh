#!/usr/bin/env bash

if ! command -v nc &> /dev/null; then
  echo "command nc not found"
  exit 1
fi

if nc -zwl example.com 443; then
  echo 'who have connectivity'
fi
