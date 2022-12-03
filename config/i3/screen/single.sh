#!/bin/bash

CONNECTED=$(xrandr --query | awk '$2 == "connected" && $1 != "eDP-1" { print $1}')

arr=($CONNECTED)

for i in ${arr[@]}; do
  xrandr --output $i --off
done

xrandr --output eDP-1 --auto --primary
