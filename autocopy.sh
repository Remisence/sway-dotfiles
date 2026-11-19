#! /bin/bash
for x in alacritty fish ranger sway waybar rofi fastfetch
do
	rsync -a ~/.config/"$x"/ ~/sway-dotfiles/"$x"/
done

rsync -a /usr/share/cachyos-fish-config/ ~/sway-dotfiles/cachyos-fish-config/

for x in .bashrc .gtkrc-2.0 .nanorc .bash_logout .bash_profile .zshrc
do
	rsync -a ~/"$x" ~/sway-dotfiles/"$x"
done

rsync -a ~/.icons/ ~/sway-dotfiles/.icons/
