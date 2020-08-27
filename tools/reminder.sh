#! /bin/sh
#
# reminder.sh
# Copyright (C) 2020 sylveryte <sylveryte@pm.me>
#
# Distributed under terms of the MIT license.
#

min=$(dmenu -p "After how many minutes?")
if [ -n "$min" ]
then
	msg=$(printf "take a short break\n take a break\n take a hike\n get back to work\n attend meeting\n" | dmenu -p "Message?")
	if [ -n "$msg" ]
	then
		sec=$(("$min * 60"))
		file=$(ls -d -1 /home/sylveryte/sylveryte/dotfiles/.remindme/* | sort -R | tail -1)
		dunstify -t 10000 "I'll have someone remind you to $msg in $min mins" </dev/null &>/dev/null
		sleep $sec && dunstify -t 200000 -i $file -a "RemindMe" "$msg" </dev/null &>/dev/null &
	fi
fi
