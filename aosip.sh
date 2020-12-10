# Buka Directory
cd ~/aosip

# Sync Repo
repo init -u git://github.com/AOSiP/platform_manifest.git -b ten
repo sync --force-sync --no-tags --no-clone-bundle

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
git clone https://github.com/kambium30/device_xiaomi_santoni -b aosip device/xiaomi/santoni
git clone https://github.com/MrArtemSid/GameOver -b testing kernel/xiaomi/msm8937
git clone https://github.com/Bikram557/android_vendor_xiaomi_santoni -b ten vendor/xiaomi/

# Clone Toolclain
git clone https://github.com/kdrag0n/proton-clang --depth=1 prebuilts/clang/host/linux-x86/clang-12

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Build Rom
source build/envsetup.sh
lunch aosip_santoni-userdebug
export KBUILD_BUILD_USER="kambium30"; export KBUILD_BUILD_HOST="ruyo"
time m kronic
