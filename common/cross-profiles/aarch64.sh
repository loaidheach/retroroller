# Cross build profile for ARMv8.

LTO_FLAGS="-flto=$(nproc) -fuse-linker-plugin"

XBPS_TARGET_MACHINE="aarch64"
XBPS_TARGET_QEMU_MACHINE="aarch64"
XBPS_CROSS_TRIPLET="aarch64-linux-gnu"
XBPS_CFLAGS="-O2 -pipe" # XXX not yet supported: -fstack-protector-strong
XBPS_CXXFLAGS="$XBPS_CFLAGS"
XBPS_CROSS_CFLAGS="-O2 -pipe -march=armv8-a+crc+simd -mtune=cortex-a35 -mcpu=cortex-a35 -U_FORTIFY_SOURCE -fno-stack-protector -fno-stack-clash-protection -ftree-vectorize -fdata-sections -ffunction-sections -fno-ident -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-math-errno -funsafe-math-optimizations -fomit-frame-pointer -ffast-math"
XBPS_CROSS_CXXFLAGS="$XBPS_CROSS_CFLAGS"
XBPS_CROSS_FFLAGS=""
XBPS_CROSS_RUSTFLAGS="--sysroot=${XBPS_CROSS_BASE}/usr"
XBPS_CROSS_RUST_TARGET="aarch64-unknown-linux-gnu"

