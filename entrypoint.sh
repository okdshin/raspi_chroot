#!/bin/bash

mount -t devtmpfs devfs /raspbian/dev
mount -t devpts devpts /raspbian/dev/pts
mount -t proc proc /raspbian/proc
mount -t sysfs sys /raspbian/sys

test -e /raspbian/usr/bin/qemu-arm-static || cp /usr/bin/qemu-arm-static /raspbian/usr/bin/
update-binfmts --enable qemu-arm

exec chroot /raspbian $@
