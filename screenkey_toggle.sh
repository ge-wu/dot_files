#!/usr/bin/env bash

# Simple script to toggle screenkey 
# Added in sxhdrc
if pgrep -x "screenkey" > /dev/null; then
    killall screenkey &
else
    screenkey &
fi
