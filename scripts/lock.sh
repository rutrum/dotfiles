#!/bin/bash

image="/tmp/lockscreen.png"

scrot $image

convert $image \
    -fill black -colorize 30% \
    -set colorspace Gray -separate -average $image

i3lock \
    --ignore-empty-password \
    -i $image