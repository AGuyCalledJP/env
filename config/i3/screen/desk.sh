#!/bin/bash

CONNECTED=$(xrandr --query | awk '$2 == "connected" { print $1}')

FIRST=$(echo $CONNECTED | cut -d " " -f 1)
SECOND=$(echo $CONNECTED | cut -d " " -f 2)

xrandr --output $FIRST --auto --primary --output $SECOND --auto --right-of $FIRST
