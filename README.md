Initial setup
-------------

1. Build docker image. Run `docker build -t raspbian-cross .`.

1. Download raspbian image from [](https://www.raspbian.org/RaspbianMirrors) unzip and save it as `raspbian.img` which is the image to be customized.
1. Extend the image size for our installation. Run `dd if=/dev/zero bs=1M count=1024 >> raspbian.img`. It will extend the image 1GB.
1. Make raspbian.img as loopback device. Run `losetup -fP raspbian.img`.
1. Extend partition. Run `gparted /dev/loop0` (The name `loop0` may be different. Check by runnng `losetup -l`).


Setup for customizing
---------------------

1. (If didn't yet): Make raspbian.img as loopback device. Run `losetup -fP raspbian.img`.
1. Mount loop0p2. Run `mount /dev/loop0p2 /mnt`.
1. Login image via docker. Run `docker run --rm -it --privileged -v /mnt:/raspbian raspbian-cross:latest`.
1. (The first time only): Copy `qeu-arm-static` binary to raspbian. Run `cp /usr/bin/qemu-arm-static /raspbian/usr/bin/`
1. Chroot. Run `chroot /raspbian /bin/bash`
1. You can now modify the image. Modify.

Write customized image to the SD card
-------------------------------------

Run `dd bs=1m if=raspbian.img of=/dev/<SD card>`

