# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/RiceDroid/android -b thirteen -g default,-mips,-darwin,-notdefault
git clone https://github.com/munsuyog/android_device_samsung_m31.git --depth 1 -b lineage-19.1 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
. build/envsetup.sh
lunch lineage_m31-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=RooGhz720
export KBUILD_BUILD_HOST=android-runner
#export SKIP_API_CHECKS=true
#export SELINUX_IGNORE_NEVERALLOWS=true
m bacon -j8
# end

