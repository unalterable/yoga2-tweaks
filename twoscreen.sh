#!/bin/sh

# This script will start Onboard, flip screen to the left, disable touchpad
# and align touchscreen to screen. Flips back, reenables touchpad and disables Onboard on second run.

output="eDP1"
touchpad="SynPS/2 Synaptics TouchPad"
touchscreen="ELAN Touchscreen"

rotation=`xrandr -q --verbose | grep $output |cut -d ' ' -f6`
if [ $rotation = "normal" ]
then
  onboard &
  xinput set-prop "$touchscreen" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1 &
else
  xrandr -o normal &
  xinput set-prop "$touchscreen" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1 &
  xinput enable "$touchpad" &
  killall -HUP onboard
fi
