#!/bin/sh
date=$(date)
echo "Input $date" >> /tmp/debug-qemu.log
echo "$@" >> /tmp/debug-qemu.log
echo ""	>> /tmp/debug-qemu.log
echo "Output $date">> /tmp/debug-qemu.log
echo "${@//01:00.0/01:00.0,x-vga=on}" >> /tmp/debug-qemu.log
echo "" >> /tmp/debug-qemu.log
exec /usr/bin/qemu-system-x86_64 -machine accel=kvm "${@//01:00.0/01:00.0,x-vga=on}"
#,romfile=/var/rom/linux.rom}"

