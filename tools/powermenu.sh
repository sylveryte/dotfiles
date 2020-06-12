#! /bin/sh
#
# powermenu.sh
# Copyright (C) 2020 sylveryte <sylveryte@pm.me>
#
# Distributed under terms of the MIT license.
#
choice=$( printf "cya\nbye\nhotboot\nlock" | dmenu -p 'Powermenu')
case $choice in
	'bye')
		systemctl poweroff
		;;
	'cya')
		systemctl suspend
		;;
	'hotboot')
		systemctl reboot
		;;
	'lock')
		~/sylveryte/dotfiles/tools/scrlock.sh
		;;
esac
