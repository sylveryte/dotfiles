#! /bin/sh
#
# powermenu.sh
# Copyright (C) 2020 sylveryte <sylveryte@pm.me>
#
# Distributed under terms of the MIT license.
#
choice=$( printf "cya\nbye\nhibernate\nhotboot\nlock" | fuzzel --dmenu -p 'Choose:')
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
	'hibernate')
		# ~/sylveryte/dotfiles/tools/scrlock.sh
    systemctl hibernate
		;;
	'lock')
		# ~/sylveryte/dotfiles/tools/scrlock.sh
    swaylock
		;;
esac
