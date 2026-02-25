#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/powermenu/theme"
theme='theme.rasi'

# Options
shutdown=' Shutdown'
reboot=' Reboot'
logout=' Logout'
yes='󰗠 Yes'
no=' No'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-theme ${dir}/${theme}
}

# Confirmation CMD
confirm_cmd() {
	rofi \
	-theme-str \
		'window {
			location: north east; 
			anchor: north east; 
			fullscreen: false; 
		}' \
	-theme-str \
		'mainbox {
			children: [ 
				"message", 
				"listview" 
			];
		}' \
	-theme-str \
		'listview {
			columns: 2; 
			lines: 1;
			horizontal-align: 0.5;
		}' \
	-theme-str \
		'element-text {
			horizontal-align: 0.5;
		}' \
	-theme-str \
	 	'textbox {
			margin: 10px;
		}' \
	-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--logout' ]]; then
			if [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == 'sway' ]]; then
				swaymsg eixt
			fi
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
