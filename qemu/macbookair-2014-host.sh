#!/usr/bin/env bash

# Create disk with:
# qemu-img create -f qcow2 disk.qcow2 30G

qemu-system-x86_64 \
  -m 4G \
  -vga virtio \
  -display default,show-cursor=on \
  -usb \
  -device usb-tablet \
  -machine type=q35,accel=hvf \
  -smp 2 \
  -cdrom <PATH_TO_YOUR_ISO_IMAGE_FILE> \
  -drive file=<PATH_TO_YOUR_DISK_FILE>,if=virtio \
  -boot order=d <PATH_TO_YOUR_DISK_FILE> \
  -cpu Nehalem
