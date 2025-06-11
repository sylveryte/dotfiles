
#! /bin/sh
#
# screenshot.sh
# Copyright (C) 2020 sylveryte <sylveryte@gazelle>
#
# Distributed under terms of the MIT license.
#

case "$1" in
	"swappy")
		grim -g "$(slurp)" - | swappy -f -
		# scrot --select ~/trisha/sc/del.png
		;;
	"satty")
	  grim -g "$(slurp)" - | satty -f - --fullscreen --init-tool arrow --annotation-size-factor 0.7 --no-window-decoration --action-on-enter save-to-clipboard  --early-exit --copy-command wl-copy
		;;
esac
