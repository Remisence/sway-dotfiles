#!/usr/bin/env bash
#

dir="$HOME/.config/rofi/launcher/theme"
theme='simple'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
