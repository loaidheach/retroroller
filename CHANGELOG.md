# 20200629

- fixed spring-ppsspp (incorrect filename in command)
- added 32bit flycast_libretro (`sudo arm-xbps install -S flycast_libretro`)
- Added spring flycast_libretro 32bit to rr-base
- Fixed volume from going to 100% upon resume from sleep
- No more text on the screen
- ppsspp with FMV patch (thanks to EmuELEC's patch)

# 20200701

- retroarch: change save and states dir to ~/saves
- retroarch: add openal audio driver
- Add `update` command to update both 64bit and 32bit

# 20200702

- Add spring_shell to launch .sh scripts from retroarch
- Retroarch default config points bios to `/roms/bios`
- New package: ppsspp-odroidgo2 from upstream with correct SDL2 mappings for both v10 and v11
- SDL-go2 library fixes
- drastic now is patchelf'd to point to SDL 2.0.10 explicitly

# 20200703

- Integrate v10 and v11 joypad into SDL2-go2 and SDL2-2.0.10-g2
- New optimized snes9x_libretro core
- Ozone scaled by 1.5x
