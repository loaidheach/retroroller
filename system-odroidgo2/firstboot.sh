#!/usr/bin/env bash

su odroid -c 'mkdir -p /home/odroid/.emulationstation/themes'

for d in arcade dreamcast atomiswave naomi saturn neogeo cps1 cps2 cps3 cps mame2003 mame fds nes virtualboy sufami snesmsu1 snes intellivision n64 gb gbc gba sgb psx nds psp sg-1000 mastersystem megadrive genesis segacd sega32x gamegear ngp ngpc tg16cd tg16 pcengine pcenginecd supergrafx vectrex wonderswan wonderswancolor atari2600 atari5200 atari800 atari7800 atarilynx msx2 msx dos coleco scummvm c64 pokemini; do 
	mkdir -p /roms/$d
	chown odroid:odroid /roms/$d
done

if [ ! -e /home/odroid/themes ]; then
	su odroid -c 'ln -sf /home/odroid/.emulationstation/themes /home/odroid/themes'
fi

if [ ! -e /home/odroid/bios ]; then
	su odroid -c 'ln -sf /home/odroid/.config/retroarch/bios /home/odroid/bios'
fi

echo "Setting up ALSA"
mkdir -p /var/lib/alsa
chmod 755 /var/lib/alsa
amixer set 'Playback Path' 'SPK'
alsactl store

exit 0
