# install golang
wget -q https://go.dev/dl/go1.18.linux-armv6l.tar.gz
tar -C /usr/local/ -zxf go1.18.linux-armv6l.tar.gz
echo 'PATH=$PATH:/usr/local/go/bin' >> /etc/profile

# setup goproxy
echo "export GOPROXY=https://goproxy.io,direct" >> /etc/profile

