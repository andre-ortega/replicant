#!/bin/bash
set -eou pipefail

curl -O $PACKER_HTTP_IP:$PACKER_HTTP_PORT/user_configuration.json
curl -O $PACKER_HTTP_IP:$PACKER_HTTP_PORT/user_credentials.json
archinstall --config user_configuration.json --creds user_credentials.json --silent

curl -O $PACKER_HTTP_IP:$PACKER_HTTP_PORT/autologin.conf
mkdir /mnt/archinstall/etc/systemd/system/getty@tty1.service.d/
mv autologin.conf /mnt/archinstall/etc/systemd/system/getty@tty1.service.d/autologin.conf
echo "roe ALL=(ALL) NOPASSWD: ALL" > /mnt/archinstall/etc/sudoers.d/00_roe

curl -O $PACKER_HTTP_IP:$PACKER_HTTP_PORT/configure.sh
mv configure.sh /mnt/archinstall/home/roe/
cp /mnt/archinstall/home/roe/.bash_profile /mnt/archinstall/home/roe/.bash_profile.bak
echo "sudo chown roe:roe ./configure.sh" >> /mnt/archinstall/home/roe/.bash_profile
echo "chmod +x /home/roe/configure.sh" >> /mnt/archinstall/home/roe/.bash_profile
echo "/home/roe/configure.sh" >> /mnt/archinstall/home/roe/.bash_profile
shutdown now -r
