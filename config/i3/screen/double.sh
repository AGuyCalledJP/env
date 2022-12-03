#!/bin/bash

CONNECTED=$(xrandr --query | awk '$2 == "connected" && $1 != "eDP-1" { print $1}')

INTERNAL="eDP-1"
EXTERNAL=$(echo $CONNECTED | cut -d " " -f 1)

echo $EXTERNAL

xrandr --output $INTERNAL --auto --output $EXTERNAL --auto --primary --left-of $INTERNAL
