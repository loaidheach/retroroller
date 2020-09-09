# 20200909

- odroid-go2-rrvl-kernel is an alternative, experimental kernel with some
  optimizations. Install manually via `sudo xbps-install -Su
  odroid-go2-rrvl-kernel` and reboot.
- SDL2 mappings added for v10 (thanks npaladin2000)
- Further optimizations to odroid-go2-rrvl-kernel

# 20200908

- SDL2 finally fixed with sane default mappings for v11 (v10 still WIP)
- ppsspp-odroigo2 updated with standalone launch script in `/roms/_rrvl`
- After upgrading, run `/roms/_rrvl/reset_ppsspp.sh` and you'll have a much
  better experience. It now has a built-in file browser.
- termwrap now sets the TERM var appropriately so it works with dialog(1)

# 20200905

- ogage (global events daemon) further optimized to use basically 0% CPU

# 20200904

- Fix SDL2 controller mappings (this doesn't mean you definitely don't need to
  remap in SDL apps!)
- ppsspp recompiled against SDL2-2.0.10 for compatibility
- New directory `/roms/_rrvl` for system managed scripts. This is where you'll
  find update.sh and standalone launchers like ppsspp.sh. Users should use
  another directory such as /roms/sh for their own scripts.
- Fixed libGLESv2 issue that prevented dreamcast from running.
- NOTE: You will *need* to remap PPSSPP controls. We can't force v11 or v10
  mapping by default for obvious reasons. You just need to do this once.
- Wifi powersave is disabled in NetworkManager. Thanks to @pyghast for testing.

# 20200903

- Port wifi disable power savings from RR
- ppsspp-odroidgo2 now replaces ppsspp-go2. You may have to run
  `sudo xbps-install -Su ppsspp-odroidgo2` to install it.

# 20200902

- ppsspp-odroidgo2 update to include speedup patch

# 20200901

- Switch to NetworkManager from wpa\_supplicant. You *must* reboot after this update
  and then reconfigure your network in retroarch (Settings-\>WiFi).
- Add WiFi configuration to retroarch
- Retroarch 1.9.0 64bit and 32bit
- Final image now includes flycast 32bit libretro core to fix issue with built-in spring
- SDL2 2.0.10 now global standard
- Turn off text on tty1 completely, use tty2 for console
- Add update.sh spring to run full system update within retroarch
- New kernel version
- Fix libGLESv2 ldconfig issue, this was caused by a bad update of the libmali drivers
- Add retrorun 64bit and 32bit package
- Add unzip, rar, 7z and xtools package by default
- RetroArch now defaults to glcore + ozone (thanks to Firebird\_WS6)
- RRVL 20200901 Final Image release!

# 20200715

- Retroarch oga driver last character in on-screen messages being cutoff fixed
- Retroarch add shutdown and reboot

# 20200714

- Downgrade SDL2 to 2.0.10 since 2.0.12 has issues

# 20200709

- kernel update with a boat load of more wifi drivers
- ppsspp-odroidgo2 updated to 1.10.2 from 1.9.4
- ppsspp-go2 removed

# 20200707

- update script updated to update xbps first
- Add openbor-odroidgo2. Launch with `openbor_direct <path to pak>`. Look at the script on how it works.
- update retroarch to use new core URL

# 20200706

- emulationstation-go2 with v10 and v11 compat es_input and es_systems.cfg from RR installed
  to ~/.emulationstation. To boot to ES instead of RA, run `sudo rm /var/service/retroarch`
  then `sudo ln -s /etc/sv/emulationstation /var/service/` and reboot.

# 20200703

- Integrate v10 and v11 joypad into SDL2-go2 and SDL2-2.0.10-g2
- New optimized snes9x_libretro core
- Ozone scaled by 1.5x

# 20200702

- Add spring_shell to launch .sh scripts from retroarch
- Retroarch default config points bios to `/roms/bios`
- New package: ppsspp-odroidgo2 from upstream with correct SDL2 mappings for both v10 and v11
- SDL-go2 library fixes
- drastic now is patchelf'd to point to SDL 2.0.10 explicitly

# 20200701

- retroarch: change save and states dir to ~/saves
- retroarch: add openal audio driver
- Add `update` command to update both 64bit and 32bit

# 20200629

- fixed spring-ppsspp (incorrect filename in command)
- added 32bit flycast_libretro (`sudo arm-xbps install -S flycast_libretro`)
- Added spring flycast_libretro 32bit to rr-base
- Fixed volume from going to 100% upon resume from sleep
- No more text on the screen
- ppsspp with FMV patch (thanks to EmuELEC's patch)


<!-- vim: set tw=80: -->
