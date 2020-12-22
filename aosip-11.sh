# Buka Directory
cd ~/aosip-11

# Sync Repo
repo init -u git://github.com/AOSiP/platform_manifest.git -b eleven
repo sync --force-sync --no-tags --no-clone-bundle

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
git clone https://github.com/kambium30/android_device_xiaomi_santoni -b aosip-11 device/xiaomi/santoni
git clone https://github.com/zhantech/android_kernel_xiaomi_santoni -b luuvy-4.9 kernel/xiaomi/msm8937
git clone https://github.com/zhantech/vendor_xiaomi_santoni -b nad-11 vendor/xiaomi/

# Clone Toolclain
git clone https://github.com/kdrag0n/proton-clang --depth=1 prebuilts/clang/host/linux-x86/clang-12

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Fix Hotspot
rm -rf hardware/qcom-caf/wlan
git clone https://github.com/SakilMondal/android_hardware_qcom-caf_wlan -b lineage-18.0 hardware/qcom-caf/wlan

# Build Rom
source build/envsetup.sh
export KBUILD_BUILD_USER="kambium30"; export KBUILD_BUILD_HOST="ruyo"
lunch aosip_santoni-userdebug
time m kronic

