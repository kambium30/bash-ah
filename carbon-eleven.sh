# Buka Directory
cd ~/carbon-eleven

# Sync Repo
repo init -u https://github.com/CarbonROM/android.git -b cr-9.0
repo sync -j8

# Hapus Out
rm -rf out
rm -rf out/.lock

# Hapus Tree
rm -rf device/xiaomi/santoni
rm -rf device/xiaomi/msm8937-common
rm -rf kernel/xiaomi/msm8937
rm -rf vendor/xiaomi

# Hapus Toolclain
rm -rf prebuilts/clang/host/linux-x86/clang-12

# Clone Tree
git clone https://github.com/kambium30/device_xiaomi_msm8937-.git -b carbon-eleven device/xiaomi/msm8937-common
git clone https://github.com/kambium30/device_xiaomi_santoni-1.git -b carbon-eleven device/xiaomi/santoni
git clone https://github.com/Wikidepia/kernel_xiaomi_santoni-4.9.git kernel/xiaomi/msm8937
git clone https://github.com/kambium30/vendor_xiaomi.git -b carbon-eleven vendor/xiaomi

# Clone Toolclain
git clone https://github.com/kdrag0n/proton-clang --depth=1 prebuilts/clang/host/linux-x86/clang-12

# Use Cache
export USE_CCACHE=1
ccache -M 150G

# Custom/Fix Hals
rm -rf hardware/qcom-caf/msm8996/audio
rm -rf hardware/qcom-caf/msm8996/display
rm -rf hardware/qcom-caf/msm8996/media
git clone https://github.com/ProtoDump/hardware_qcom_audio hardware/qcom-caf/msm8996/audio
git clone https://github.com/ProtoDump/hardware_qcom_display hardware/qcom-caf/msm8996/display
git clone https://github.com/ProtoDump/hardware_qcom_media hardware/qcom-caf/msm8996/media

# Build Rom
. build/envsetup.sh
export KBUILD_BUILD_USER="kambium30"; export KBUILD_BUILD_HOST="ruyo"
lunch
make carbon -j12
