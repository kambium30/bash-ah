# Buka Directory
cd ~/cr-8.0

# Sync Repo
repo init -u https://github.com/CarbonROM/android.git -b cr-8.0
repo sync -j8

# Hapus Out
rm -rf out
rm -rf out/.lock

# Hapus Tree
rm -rf device/xiaomi/santoni
rm -rf kernel/xiaomi/msm8937
rm -rf vendor/xiaomi

# Hapus Toolclain
rm -rf prebuilts/clang/host/linux-x86/clang-12

# Clone Tree
git clone https://github.com/kambium30/device_xiaomi_santoni -b carbon-10 device/xiaomi/santoni
git clone https://github.com/MrArtemSid/GameOver -b R kernel/xiaomi/msm8937
git clone https://github.com/kambium30/vendor_xiaomi_santoni -b cr-8.0 vendor/xiaomi/

# Clone Toolclain
git clone https://github.com/kdrag0n/proton-clang --depth=1 prebuilts/clang/host/linux-x86/clang-12

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Build Rom
. build/envsetup.sh
lunch
export KBUILD_BUILD_USER="kambium30"; export KBUILD_BUILD_HOST="ubuntu"
make carbon -j12
