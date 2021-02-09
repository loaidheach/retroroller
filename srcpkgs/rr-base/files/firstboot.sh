#!/bin/sh

# script based on https://salsa.debian.org/raspi-team/image-specs/-/blob/master/rpi-resizerootfs

if [ ! -f /firstboot ]; then
    exit 0
fi

echo "  ______ ______ ___ ___ _____   " >> /dev/tty1
echo " |   __ \   __ \   |   |     |_ " >> /dev/tty1
echo " |      <      <   |   |       |" >> /dev/tty1
echo " |___|__|___|__|\_____/|_______|" >> /dev/tty1
echo >> /dev/tty1
echo >> /dev/tty1
echo >> /dev/tty1
echo "* Initializing ALSA" >> /dev/tty1

amixer set 'Playback Path' 'SPK'
alsactl store

echo "* Setting background light to sane level" >> /dev/tty1
light -S 50

echo "* Resizing root partition" >> /dev/tty1
sync

rootpart=/dev/mmcblk0p2
rootdev=/dev/mmcblk0

sfdisk -f $rootdev -N 2 <<EOF &>/dev/null
,+
EOF

sleep 5

echo "* Waiting for root to settle" >> /dev/tty1
udevadm settle

sleep 5

echo "* Actually resize root partition" >> /dev/tty1
partprobe $rootdev

mount -o remount,rw $rootpart
resize2fs $rootpart &> /dev/null

echo "* Syncing disks" >> /dev/tty1
sync

touch /forcefsck
rm /firstboot

clear > /dev/tty1
printf "\033c" > /dev/tty1
