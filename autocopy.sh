#! /bin/bash
for x in alacritty fish ranger sway waybar rofi
do
	cp -r ~/.config/"$x" ~/sway-dotfiles/
done
