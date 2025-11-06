#! /bin/sh

dir="$HOME/.config/rofi/simple-launcher"
theme="simple-launcher.rasi"

## Run
rofi -no-config -no-lazy-grab -show drun -modi drun \
    -show drun \
    -theme ${dir}/${theme}
