# Buka Directory
cd ~/cr-9.0

# Sync Repo
repo init -u https://github.com/CarbonROM/android.git -b cr-9.0
repo sync -j8

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
rm -rf prebuilts/clang/host/linux-x86/clang-r399163b

# Clone Tree
git clone https://github.com/kambium30/android_device_xiaomi_santoni -b cr-9.0 device/xiaomi/santoni
git clone https://github.com/MrArtemSid/android_kernel_xiaomi_santoni_msm4.9 -b R-caf kernel/xiaomi/msm8937
git clone https://github.com/kambium30/vendor_xiaomi_santoni -b cr-9.0-backup vendor/xiaomi/

# Clone Toolclain
git clone https://github.com/crdroidandroid/android_prebuilts_clang_host_linux-x86_clang-6875598 --depth=1 prebuilts/clang/host/linux-x86/clang-r399163b

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Fix Hotspot
rm -rf hardware/qcom-caf/wlan
git clone https://github.com/SakilMondal/android_hardware_qcom-caf_wlan -b lineage-18.0 hardware/qcom-caf/wlan

# Build Rom
. build/envsetup.sh
export KBUILD_BUILD_USER="kambium30"; export KBUILD_BUILD_HOST="ruyo"
lunch
make carbon -j12

