#!/bin/bash

dnf install systemd-ukify

/usr/lib/systemd/ukify build --linux=/lib/modules/$(uname -r)/vmlinuz --initrd=/boot/initramfs-$(uname -r).img --cmdline="$(cat /etc/kernel/cmdline)" --output=/boot/efi/EFI/Linux/linux-$(uname -r).efi

