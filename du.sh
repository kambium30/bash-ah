# Buka Directory
cd ~/du

# Sync Repo
repo init -u https://github.com/DirtyUnicorns/android_manifest.git -b q10x
repo sync --force-sync -j$( nproc --all )

# Hapus Out
rm -rf out
rm -rf out/.lock

# Hapus Tree
rm -rf device/xiaomi/santoni
rm -rf kernel/xiaomi/msm8937
rm -rf vendor/xiaomi/santoni

# Hapus Toolclain
rm -rf prebuilts/clang/host/linux-x86/clang-12

# Clone Tree
git clone https://github.com/kambium30/device_xiaomi_santoni -b du device/xiaomi/santoni
git clone https://github.com/MrArtemSid/GameOver -b testing kernel/xiaomi/msm8937
git clone https://github.com/kambium30/android_vendor_du -b q10x vendor/xiaomi/santoni

# Clone Toolclain
git clone https://github.com/kdrag0n/proton-clang --depth=1 prebuilts/clang/host/linux-x86/clang-12

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Build Rom
. build/envsetup.sh
export KBUILD_BUILD_USER="kambium30"; export KBUILD_BUILD_HOST="ubuntu"
lunch santoni
mka bacon

