#!/bin/sh

xrdb -merge ~/.Xresources &
# xrandr --output DP-0 --output DP-4 --primary --right-of DP-0 &
exec bspwm 
