#! /bin/sh
#
# kwolski_analysis.sh
# Copyright (C) 2020 sylveryte <sylveryte@gazelle>
#
# Distributed under terms of the MIT license.
#


stats="$(acpi | awk '{print $4}') $(timedatectl|head -n 1 | awk '{print $3 " "  $4 " " $5}') $(nmcli -g all | grep 'connected to' | sed 's/connected to //g')"

echo $stats

dunstify -t 15000 -i $(ls ~/Pictures/Wallpapers/story/* | sort -R | head -1) -a 'Sylnotification' "$stats"
