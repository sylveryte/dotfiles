
#! /bin/sh
#
# screenshot.sh
# Copyright (C) 2020 sylveryte <sylveryte@gazelle>
#
# Distributed under terms of the MIT license.
#

case "$(printf "select\nfocused\nwhole" | dmenu -p "screenshot")" in
	"select")
		spectacle -r
		# scrot --select ~/trisha/sc/del.png
		;;
	"focused")
		spectacle -a
		# scrot --focused ~/trisha/sc/del.png
		;;
	"whole")
		scrot ~/trisha/sc/del.png
		;;
esac
