#! /bin/sh
#
# powermenu.sh
# Copyright (C) 2020 sylveryte <sylveryte@pm.me>
#
# Distributed under terms of the MIT license.
#
choice=$( printf "cya\nbye\nhibernate\nhotboot\nlock\nlogout" | fuzzel --dmenu -p 'Choose:')
case $choice in
	'Bye')
		systemctl poweroff
		;;
	'cya')
		sh ~/sylveryte/dotfiles/tools/scrlock.sh
		systemctl suspend
		;;
	'hotboot')
		systemctl reboot
		;;
	'hibernate')
    systemctl hibernate
		;;
	'lock')
		sh ~/sylveryte/dotfiles/tools/scrlock.sh
		;;
  'logout')
    niri msg action quit
    ;;
esac
