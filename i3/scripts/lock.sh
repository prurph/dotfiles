#!/bin/sh

# Lock i3, setting the image to a blurred capture of the current screen

img=/tmp/i3lock.png

rm $img 2> /dev/null
scrot $img
convert $img -blur 0x8 $img

i3lock -u -i $img
