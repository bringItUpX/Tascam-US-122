# Tascam-US-122
installs the driver of Tascam US-122 microphone interface device in Ubuntu 24.04

After plug in of the Tascam US-122 in the Usb plug please download the above .sh script and run it in a terminal with

sudo bash ./tascam-us-122-install.sh

This shell script downloads the firmware of Tascam US-122 from www.alsa-project.org compiles and installs it. There is also a udev rule in this repo, that you can place in /etc/udev/rules.d/ , but this I not recommand. This udev rules automicly starts the usx2yloader program after you plugged the Tascasm US-122 in the USB plug of your PC. But if the Tascam US-122 is already plugged in during booting your PC, my Ubuntu 24.04 PC froce during start, because of this udev rule. Better is then you do not install this udev rule and you start the usx2yloader binary every time by hand after the PC is booted. After starting usx2yloader the green LED of the Tascom US-122 switches on and you can i.e. start Audacity and open the sound config to change to the recording device Tascam US-122. If you plug out and plug in again the usb plug of the Tascam, then you have to start usx2yloader again.





































Please
