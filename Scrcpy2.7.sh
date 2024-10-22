#!/bin/bash

echo -e "\033[33mScrcpy 2.7 automation by Haider Nadeem\033[0m"
echo -e "\033[31mLicensed by Messi and Patented by Ronaldo\033[0m"


sleep 5
# Introductory messages
echo "Scrcpy installation will start in 3... 2... 1..."
sleep 3
echo "type exit and press enter to see the process"
sleep 2


#Entering root


#removing scrcpy old version if installed
sudo snap remove scrcpy
sleep 3
sudo -i
sleep 2
# Add your Network proxies here if needed
#export http_proxy=http://x.x.x.x:xxxx
#export https_proxy=http://x.x.x.x:xxxx
#git config --global http.proxy http://x.x.x.x:xxxx
#git config --global https.proxy http://x.x.x.x:xxxx

# Go to the desired directory
cd ../..

# Add proxy to dnf config
sed -i '/\[main\]/a proxy=http://10.158.100.2:8080' /etc/dnf/dnf.conf

# Navigate to Downloads directory
cd /home/ute/Downloads/

# Install necessary packages
dnf update -y
dnf install epel-release -y
dnf config-manager --set-enabled crb
dnf update -y
dnf install android-tools -y
dnf install git -y
dnf install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm -y
dnf install --nogpgcheck https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm -y
dnf install ffmpeg ffmpeg-devel -y
dnf install libusb1-devel -y
dnf groupinstall "Development Tools" -y
dnf --enablerepo=crb install ninja-build -y
dnf install meson -y
dnf install SDL2-devel -y

# Re-add proxies before cloning
# Add your Network proxies here if needed
#export http_proxy=http://x.x.x.x:xxxx
#export https_proxy=http://x.x.x.x:xxxx
#git config --global http.proxy http://x.x.x.x:xxxx
#git config --global https.proxy http://x.x.x.x:xxxx

# Clone scrcpy repository
git clone https://github.com/Genymobile/scrcpy

# Navigate to scrcpy directory and install
cd scrcpy
./install_release.sh

sleep 10
# Check scrcpy version
scrcpy --version

sleep 2
echo "Scrcpy is now installed. To check scrcpy version, run 'scrcpy --version'"
echo "Scrcpy automation by Haider Nadeem"
