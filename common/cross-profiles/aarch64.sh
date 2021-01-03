# Cross build profile for ARMv8.

XBPS_TARGET_MACHINE="aarch64"
XBPS_TARGET_QEMU_MACHINE="aarch64"
XBPS_CROSS_TRIPLET="aarch64-linux-gnu"
XBPS_CFLAGS="-O2 -pipe" # XXX not yet supported: -fstack-protector-strong
XBPS_CXXFLAGS="$XBPS_CFLAGS"
XBPS_CROSS_CFLAGS="-march=armv8-a+crc+fp+simd -mtune=cortex-a35 -mcpu=cortex-a35 -pipe -O2 -U_FORTIFY_SOURCE -fno-stack-protector -fno-stack-clash-protection -fomit-frame-pointer"
XBPS_CROSS_CXXFLAGS="$XBPS_CROSS_CFLAGS"
XBPS_CROSS_FFLAGS="$XBPS_CROSS_CFLAGS"
XBPS_CROSS_RUSTFLAGS="--sysroot=${XBPS_CROSS_BASE}/usr"
XBPS_CROSS_RUST_TARGET="aarch64-unknown-linux-gnu"

LTO_FLAGS="-flto=$(nproc) -fuse-linker-plugin"
OPT_CFLAGS="-ftree-vectorize -fdata-sections -ffunction-sections -fno-ident -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-math-errno -funsafe-math-optimizations -ffast-math"

