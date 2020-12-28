# Buka Directory
cd ~/pixel

# Sync Repo
repo init -u https://github.com/PixelExtended/manifest -b eleven
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

# Hapus Out
rm -rf out
rm -rf out/.lock

# Hapus Tree
rm -rf device/xiaomi/santoni
rm -rf kernel/xiaomi/msm8937
rm -rf vendor/xiaomi

# Hapus Qcom Power
rm -rf vendor/qcom/opensource/power

# Hapus Toolclain
rm -rf prebuilts/clang/host/linux-x86/clang-12

# Clone Tree
git clone https://github.com/PixelExtended/device_xiaomi_santoni -b eleven device/xiaomi/santoni
git clone https://github.com/MrArtemSid/android_kernel_xiaomi_santoni_msm4.9 -b R-caf kernel/xiaomi/msm8937
git clone https://github.com/PixelExtended/vendor_xiaomi_santoni -b eleven vendor/xiaomi/

# Clone Toolclain
git clone https://github.com/kdrag0n/proton-clang --depth=1 prebuilts/clang/host/linux-x86/clang-12

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Fix Hotspot
rm -rf hardware/qcom-caf/wlan
git clone https://github.com/SakilMondal/android_hardware_qcom-caf_wlan -b lineage-18.0 hardware/qcom-caf/wlan

# Build Rom
. build/envsetup.sh
export KBUILD_BUILD_USER="kambium30"; export KBUILD_BUILD_HOST="ruyo"
lunch aosp_santoni-userdebug
mka bacon -j12
