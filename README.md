# alpine-openstack-image
Alpine Linux OpenStack VM Image

## Prerequisites

Install Packer: https://www.packer.io/intro/getting-started/install.html

## Getting Started

```
packer plugins install github.com/hashicorp/virtualbox
packer build -var "root_pw=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 32)" alpine.json
qemu-img convert -f vmdk -O raw output-virtualbox-iso/alpine316-disk001.vmdk output-virtualbox-iso/alpine316-disk001.raw
openstack image create --file output-virtualbox-iso/alpine316-disk001.raw --disk-format raw --property os_distro='alpine' --property os_type='linux' --property hw_vif_multiqueue_enabled='True' --container-format bare alpine
```
