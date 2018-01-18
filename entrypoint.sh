#!/bin/bash

# For easy debugging
# set -ex

if [ "$1" == "--" ] || [ "$1" == "sh" ]; then
  echo "Running user provided command: [ $@ ]"
  exec $@
else
  exec argo $@
fi
