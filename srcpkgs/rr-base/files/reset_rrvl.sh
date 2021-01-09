#/usr/bin/env bash

rm -rf ~/.config/ppsspp
cp /etc/retroarch.cfg /home/odroid/.config/retroarch/

dialog --timeout 1 --beep --msgbox "Reset complete" 5 30

sleep 1
