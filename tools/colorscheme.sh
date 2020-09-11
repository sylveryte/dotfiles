#! /bin/bash
#
# colorscheme.sh
# Copyright (C) 2020 sylveryte <sylveryte@pm.me>
#
# Distributed under terms of the MIT license.
#

GALAXYDIR=~/Pictures/galaxy
DARKTHEMES=~/sylveryte/dotfiles/tools/colors/dark
LIGHTTHEMES=~/sylveryte/dotfiles/tools/colors/light
HISTTHEMES=~/sylveryte/themes
FAVTHEMES=~/sylveryte/dotfiles/tools/colors/fav
TEMPFAVTHEMES=/tmp/fav

announce_applied(){
	echo $1 >> ~/sylveryte/themes
	echo $1
	dunstify -t 15000 -a 'Sylnotification' "theme applied $1"
}

apply_theme(){
	if [ -n "$1" ]
	then
		wal --theme $1
		announce_applied $1
	fi
}

apply_theme_light(){
	if [ -n "$1" ]
	then
		wal -l --theme $1
		announce_applied $1
	fi
}

console_log(){
	dunstify -t 13000 -a 'log' "$1"
}
if [ -n "$1" ]
then
	c=$1
else
	c=$(printf "favs\nlast\naddtofav\nlight\ndark\nrandom" | dmenu)
fi
case "$c" in
	'light')
		apply_theme_light $(cat $LIGHTTHEMES | sort -R | dmenu -p "Light themes")
		;;
	'random')
		apply_theme $(cat $DARKTHEMES | sort -R | head -n 1)
		;;
	'last')
		apply_theme $(cat $HISTTHEMES | tail | tac | dmenu -p "Last themes")
		;;
	'favsrandom')
		apply_theme $(cat $FAVTHEMES | sort -R | head -n 1)
		;;
	'favs')
		apply_theme $(cat $FAVTHEMES | sort -R | dmenu -p "Favourite themes")
		;;
	'addtofav')
		# sort -u ~/sylveryte/themes > ~/sylveryte/themes # mistake will erase file before reading
		# awk '!a[$0]++' ~/sylveryte/themes # fast but no output
		# uniq ~/sylveryte/themes > ~/sylveryte/themestmp && mv ~/sylveryte/themestmp ~/sylveryte/themes
		k=$(tac $HISTTHEMES | dmenu -p "Add to favourites")
		echo "Got $k"
		if [ -n "$k" ]
		then
			echo "Asking for conf"
			conf=$( printf "y\nn" | dmenu -p "sure? add $k to fav? (y/n)")
			echo "Conf is $conf"
			if [ $conf = "y" ]
			then
				echo "Adding $k to $FAVTHEMES"
				echo $k >> $FAVTHEMES
				uniq $FAVTHEMES > $TEMPFAVTHEMES && cp $TEMPFAVTHEMES $FAVTHEMES
				dunstify -t 5000 -i $(ls $GALAXYDIR | sort -R | head -1) -a 'Sylnotification' "added $k to favs"
			fi
		fi
		exit
		;;
	'dark')
		apply_theme $(cat $DARKTHEMES | sort -R | dmenu -p "Dark themes")
		;;
esac

