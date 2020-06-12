#! /bin/bash
#
# colorscheme.sh
# Copyright (C) 2020 sylveryte <sylveryte@pm.me>
#
# Distributed under terms of the MIT license.
#

announce_applied(){
	echo $1 >> ~/sylveryte/themes
	echo $1
	dunstify -t 5000 -i $(ls ~/Pictures/Wallpapers/story/* | sort -R | head -1) -a 'Sylnotification' "theme applied $1"
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
	dunstify -t 3000 -a 'log' "$1"
}
if [ -n "$1" ]
then
	c=$1
else
	c=$(printf "favs\nlast\naddtofav\nlight\ndark\nrandom" | dmenu)
fi
case "$c" in
	'light')
		apply_theme_light $(cat ~/sylveryte/dotfiles/tools/colors/light | sort -R | dmenu -p "Light themes")
		;;
	'random')
		apply_theme $(cat ~/sylveryte/dotfiles/tools/colors/dark | sort -R | head -n 1)
		;;
	'last')
		apply_theme $(cat ~/sylveryte/themes | tail | tac | dmenu -p "Last themes")
		;;
	'favs')
		apply_theme $(cat ~/sylveryte/dotfiles/tools/colors/fav | sort -R | dmenu -p "Favourite themes")
		;;
	'addtofav')
		# sort -u ~/sylveryte/themes > ~/sylveryte/themes # mistake will erase file before reading
		# awk '!a[$0]++' ~/sylveryte/themes # fast but no output
		uniq ~/sylveryte/themes > ~/sylveryte/themestmp && mv ~/sylveryte/themestmp ~/sylveryte/themes
		k=$(cat ~/sylveryte/themes | tac | dmenu -p "Add to favourites")
		if [ -n "$k" ]
		then
			conf=$(dmenu -p "sure? add $k to fav? (y/n)")
			if [ $conf = "y" ]
			then
				echo $k >> ~/sylveryte/dotfiles/tools/colors/fav
				dunstify -t 5000 -i $(ls ~/Pictures/Wallpapers/story/* | sort -R | head -1) -a 'Sylnotification' "added $k to favs"
			fi
		fi
		exit
		;;
	'dark')
		apply_theme $(cat ~/sylveryte/dotfiles/tools/colors/dark | sort -R | dmenu -p "Dark themes")
		;;
esac

