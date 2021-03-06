# setup tsu package registry
cp /etc/apt/sources.list /etc/apt/sources.list.backup
cat > /etc/apt/sources.list << EOF
deb [arch=armhf] http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ bullseye main non-free contrib rpi
deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ bullseye main non-free contrib rpi
EOF
cp /etc/apt/sources.list.d/raspi.list /etc/apt/sources.list.d/raspi.list.backup
cat > /etc/apt/sources.list.d/raspi.list << EOF
deb http://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ bullseye main
EOF

# update package info
apt update

# install essential packages
apt install vim -y

