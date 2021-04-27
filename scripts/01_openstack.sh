set -ux

apk add --no-cache cloud-init
apk add --no-cache acpi

# Start Cloud-Init on Boot
rc-update add cloud-init default

echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
sed -i '/lock_passwd/c\     lock_passwd: False' /etc/cloud/cloud.cfg
