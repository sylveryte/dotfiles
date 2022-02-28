source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
# xinput set-prop 11 --type=int 306 1
# wal -R
# sxhkd&
# exec i3
# exec dwm
# exec awesome
exec bspwm
# exec startxfce4
# xmodmap /home/sylveryte/.speedswapper
 # export DESKTOP_SESSION=plasma
 # exec startplasma-x11
