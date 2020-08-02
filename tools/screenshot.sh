
#! /bin/sh
#
# screenshot.sh
# Copyright (C) 2020 sylveryte <sylveryte@gazelle>
#
# Distributed under terms of the MIT license.
#

case "$(printf "select\nfocused\nwhole" | dmenu -p "screenshot")" in
	"select")
		scrot --select
		;;
	"focused")
		scrot --focused
		;;
	"whole")
		scrot
		;;
	"connect")
		dev=$(bluetoothctl devices | dmenu -p "devices")
		bluetoothctl connect $(echo $dev | awk '{print $2}')
		;;
esac
