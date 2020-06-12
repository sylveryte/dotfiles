#! /bin/sh
#
# sylscripts.sh
# Copyright (C) 2020 sylveryte <sylveryte@gazelle>
#
# Distributed under terms of the MIT license.
#

case "$(printf "connect\non\noff\nscan" | dmenu -p "bluetooth")" in
	"on")
		bluetoothctl power on
		;;
	"off")
		bluetoothctl power off
		;;
	"scan")
		bluetoothctl power off
		;;
	"connect")
		dev=$(bluetoothctl devices | dmenu -p "devices")
		bluetoothctl connect $(echo $dev | awk '{print $2}')
		;;
esac
