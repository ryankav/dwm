#!/usr/bin/env bash

while true; do
    # Log stderror to a file 
    dwm 1> /dev/null 2> ~/.dwm.log || break
    # No error logging
    #dwm >/dev/null 2>&1
done
