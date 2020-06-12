#!/bin/sh
case "$1" in
  start)
    $0 stop 
	pactl load-module module-simple-protocol-tcp rate=44100 format=s16le channels=1 source=0 record=true port=8071
    ;;
  stop)
    pactl unload-module `pactl list | grep tcp -B1 | grep M | sed 's/[^0-9]//g'`
    ;;
  *)
    echo "Usage: $0 start|stop" >&2
    ;;
esac
