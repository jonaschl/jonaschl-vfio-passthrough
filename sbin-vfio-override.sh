#!/bin/sh

DEVS="0000:01:00.0 0000:01:00.1 0000:00:02.0"

for DEV in $DEVS; do
    echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
done
echo "vfio-pci" > /sys/bus/pci/devices/0000:06:00.0/driver_override
modprobe -i vfio-pci
# USB 3.0 card vfio-pci
echo 0000:06:00.0 > /sys/bus/pci/devices/0000\:06\:00.0/driver/unbind
echo 1b6f 7023 > /sys/bus/pci/drivers/vfio-pci/new_id
# USB 2.0 card vfio-pci 
echo 0000:00:1a.0 > /sys/bus/pci/devices/0000\:00\:1a.0/driver/unbind
echo 0000:00:1d.0 > /sys/bus/pci/devices/0000\:00\:1d.0/driver/unbind
echo 8086 1c2d > /sys/bus/pci/drivers/vfio-pci/new_id
echo 8086 1c26 > /sys/bus/pci/drivers/vfio-pci/new_id
