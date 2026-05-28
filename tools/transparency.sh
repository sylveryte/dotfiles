#! /bin/sh
#
# transparency.sh
# Copyright (C) 2020 sylveryte <sylveryte@pm.me>
#
# Distributed under terms of the MIT license.
#

kill_picom(){
	killall picom
	sleep 1
}

apply_transparency(){
	picom --xrender-sync-fence --active-opacity $1 --blur-background-fixed &
}

choice=$(printf "kill" | dmenu -p "Transparency? kill/0-100")

case "$choice" in
	'kill')
		kill_picom
		;;
	*)
		kill_picom && apply_transparency $(echo "$choice/100" | bc -l)
		;;
esac
