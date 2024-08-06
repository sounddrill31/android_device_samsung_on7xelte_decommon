echo "Copying Toolchain"

# Clone GCC from Android 11
if [ ! -d "prebuilts/toolchain" ]; then
    echo "prebuilts/toolchain not found! Downloading..."
    git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9 -b lineage-18.1 prebuilts/toolchain  --depth=1
fi

# Clone Clang from Android 11
if [ ! -d "prebuilts/toolchain-clang" ]; then
    echo "prebuilts/toolchain-clang not found! Downloading..."
    git clone https://anndroid.googlesource.com/platform/prebuilts/clang/host/linux-x86 -b android-11.0.0_r46 prebuilts/toolchain-clang  --depth=1
fi

# Create ld symlink to avoid linking error(s)
ln -s $(pwd)/prebuilts/clang/host/linux-x86/clang-r383902b/bin/lld \
    $(pwd)/prebuilts/clang/host/linux-x86/clang-r383902b/bin/ld &> /dev/null
