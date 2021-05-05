set -ux

# Cleanup apk
apk cache clean
rm -rf /var/cache/apk/*

# Disable Root SSH Login
sed -i '/PermitRootLogin no/d' /etc/ssh/sshd_config

# disable root pw
passwd root -l

# Fill Disk with Zeros
dd if=/dev/zero of=/EMPTY bs=1M
dd if=/dev/zero of=/boot/EMPTY bs=1M

# Remove Zeroes
rm -f /EMPTY
rm -f /boot/EMPTY

# Block until the empty file has been removed, otherwise, Packer
# will try to kill the box while the disk is still full and that's bad
sync
sync
sync

exit 0
