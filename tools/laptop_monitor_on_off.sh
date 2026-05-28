
case "$1" in
  "on")
    niri msg output eDP-1 on
    notify-send "Turing on"
  ;;
  "off")
    niri msg output eDP-1 off
    notify-send "Turing off"
  ;;
esac
