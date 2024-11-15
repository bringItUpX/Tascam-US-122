set -e
mkdir Tascam-US-122
cd Tascam-US-122
sudo apt install fxload alsa-base alsa-firmware-loaders alsa-tools alsa-tools-gui alsa-utils alsamixergui alien

wget https://www.alsa-project.org/files/pub/firmware/alsa-firmware-1.2.4.tar.bz2
tar -xvjf alsa-firmware-1.2.4.tar.bz2
cd alsa-firmware-1.2.4/
./configure --prefix=/usr
make
sudo make install
sudo dpkg-reconfigure alsa-base

IFS=' '
tas=$( lsusb | grep "Tascam" )
echo "$tas"
part=( $tas )
tasbus=${part[1]}
tasdevlong=${part[3]}

tasdevtwo=${tasdevlong//:/ }}
tasdev=(${tasdevtwo[0]})
echo "bus=$tasbus"
echo "dev=$tasdev"
echo "/dev/bus/usb/$tasbus/$tasdev"


sudo fxload -s ./tascam_loader.ihx -I /usr/share/alsa/firmware/usx2yloader/us122fw.ihx -D /dev/bus/usb/$tasbus/$tasdev

sudo ln -s /usr/share/alsa/firmware/usx2yloader /lib/firmware/usx2yloader

echo "Driver was installed. Please write usx2yloader in the termainal and press enter (After every boot of your computer)."
