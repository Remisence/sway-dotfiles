#! /bin/bash
for x in alacritty fish ranger sway waybar rofi
do
	rsync -a ~/.config/"$x"/ ~/sway-dotfiles/"$x"/
done
