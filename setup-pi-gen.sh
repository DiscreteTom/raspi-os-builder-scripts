#!/bin/bash

user=$(whoami)
if [ "$user" != "root" ]
then
  echo "Please run as root."
  exit 1
fi

apt update && apt upgrade -y

apt-get install coreutils quilt parted qemu-user-static debootstrap zerofree zip \
dosfstools libarchive-tools libcap2-bin grep rsync xz-utils file git curl bc \
qemu-utils kpartx gpg pigz -y

git clone --depth 1 https://github.com/RPI-Distro/pi-gen.git

pushd pi-gen

cat > config << EOF
IMG_NAME=MyRaspi

FIRST_USER_NAME=pi
FIRST_USER_PASS=raspberry

LOCALE_DEFAULT=en_US.UTF-8
KEYBOARD_KEYMAP=us
KEYBOARD_LAYOUT="English (US)"
TIMEZONE_DEFAULT=Asia/Shanghai

# WPA_ESSID=<wifi name>
# WPA_PASSWORD=<wifi password>
# WPA_COUNTRY=CN

ENABLE_SSH=1

RELEASE=bullseye
EOF

touch ./stage3/SKIP ./stage4/SKIP ./stage5/SKIP
touch ./stage4/SKIP_IMAGES ./stage5/SKIP_IMAGES

pushd stage2

rm -f EXPORT_NOOBS || true

step="04-customize"
if [ -d "$step" ]; then rm -Rf $step; fi
mkdir $step && pushd $step

script="00-run-chroot.sh"
cat > $script << EOF
# <your custom script>
EOF

chmod +x $script

popd
popd

echo
echo '==== Setup Finished ===='
echo 'Run "cd pi-gen && ./build.sh" to start build.'
echo "Modify pi-gen/config and pi-gen/stage2/$step/$script to customize your image."

