export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME bspwm)/environ)
icon=$(ls ~/Pictures/Wallpapers/story/* | sort -R | head -1)
msg=$1
dunstify -t 955000 -i $icon -a 'Sylnotification' "$1"
