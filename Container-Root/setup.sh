#!/bin/sh

if [ -d /etc/apt ]; then
        [ -n "$http_proxy" ] && echo "Acquire::http::proxy \"${http_proxy}\";" > /etc/apt/apt.conf; \
        [ -n "$https_proxy" ] && echo "Acquire::https::proxy \"${https_proxy}\";" >> /etc/apt/apt.conf; \
        [ -f /etc/apt/apt.conf ] && cat /etc/apt/apt.conf
fi

# Install curl
apk update
apk add curl

# Setup install dir
mkdir /install
cd /install

# Install helm and tiller
curl -L -o helm.tar.gz https://get.helm.sh/helm-v2.15.0-linux-amd64.tar.gz
tar xvf helm.tar.gz
mv -f linux-amd64/helm linux-amd64/tiller /usr/local/bin
rm -rf linux-amd64
rm -f helm.tar.gz

# Install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin

cd /
rm -rf install

