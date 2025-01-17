# Cross build profile for ARMv7 GNU EABI Hard Float.

XBPS_TARGET_MACHINE="armv7l"
XBPS_TARGET_QEMU_MACHINE="arm"
XBPS_CROSS_TRIPLET="armv7l-linux-gnueabihf"
XBPS_CROSS_CFLAGS="-march=armv7-a -mtune=cortex-a35 -mfpu=neon-vfpv4 -mfloat-abi=hard -U_FORTIFY_SOURCE -fno-stack-protector -ftree-vectorize -fdata-sections -ffunction-sections"
#XBPS_CROSS_CFLAGS+=" -flto=$(nproc) -fuse-linker-plugin"
XBPS_CROSS_CXXFLAGS="$XBPS_CROSS_CFLAGS"
#XBPS_CROSS_LDFLAGS+=" -flto=$(nproc) -fuse-linker-plugin"
XBPS_CROSS_FFLAGS="$XBPS_CROSS_CFLAGS"
XBPS_CROSS_RUSTFLAGS="--sysroot=${XBPS_CROSS_BASE}/usr"
XBPS_CROSS_RUST_TARGET="armv7-unknown-linux-gnueabihf"
XBPS_CROSS_ZIG_TARGET="arm-linux-gnueabihf"
XBPS_CROSS_ZIG_CPU="generic+v7a+vfp3"
