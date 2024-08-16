#!/usr/bin/env bash

SELECTION=$(echo -e "Power Off\nReboot\nLog Out" | bemenu --list 20 --center --width-factor 0.5 --border 2 --fixed-height --ignorecase)

case $SELECTION in

  "Power Off")
    systemctl poweroff
    ;;

  "Restart")
    systemctl reboot
    ;;

  "Log Out")
    swaymsg exit
    ;;
esac
