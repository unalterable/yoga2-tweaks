#!/bin/sh

# This script will start Onboard, flip screen to the left, disable touchpad
# and align touchscreen to screen. Flips back, reenables touchpad and disables Onboard on second run.

output="eDP1"
touchpad="SynPS/2 Synaptics TouchPad"
touchscreen="ELAN Touchscreen"

rotation=`xinput list-props "ELAN Touchscreen" | grep "Coordinate Transformation Matrix" | cut -d':' -f2 | xargs | cut -d',' -f1,2,3,4,5,6,7,8,9`


if [ "$rotation" = '1.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000' ]
then
  echo "Two Screen Transformation"
  xinput set-prop "$touchscreen" "Coordinate Transformation Matrix" 1 0 0 0 0.5 0.5 0 0 1
else
  echo "One Screen Transformation"
  xinput set-prop "$touchscreen" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
fi
