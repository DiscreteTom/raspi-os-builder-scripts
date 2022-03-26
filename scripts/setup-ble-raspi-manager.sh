# create a folder
mkdir /root/brm
pushd /root/brm

# download a release
wget -q https://github.com/DiscreteTom/ble-raspi-manager/releases/latest/download/brm-arm.zip
# or, for arm 64:
# wget https://github.com/DiscreteTom/ble-raspi-manager/releases/latest/download/brm-arm64.zip

# unzip and remove zip file
unzip brm* && rm *.zip

# install the service
cp brm.service /etc/systemd/system/

# optional: modify config

# start the service on system startup
systemctl enable brm

popd