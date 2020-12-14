# Buka Directory
cd ~/conquer

# Sync Repo
repo init -u git://github.com/ConquerOS/manifest.git -b ten
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)

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
git clone https://github.com/kambium30/device_xiaomi_santoni -b conquer device/xiaomi/santoni
git clone https://github.com/MrArtemSid/GameOver -b testing kernel/xiaomi/msm8937
git clone https://github.com/kambium30/vendor_xiaomi_santoni -b cr-8.0 vendor/xiaomi/

# Clone Toolclain
git clone https://github.com/kdrag0n/proton-clang --depth=1 prebuilts/clang/host/linux-x86/clang-12

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Build Rom
. build/envsetup.sh
export KBUILD_BUILD_USER="kambium30"; export KBUILD_BUILD_HOST="ubuntu"
lunch conquer_santoni-userdebug
mka carthage -j12

