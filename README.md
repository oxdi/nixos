Base Cycle OS build scripts
===========================

Cycle's OS is based on [NixOS](http://nixos.org), a linux distribution with a purely functional
package manager. 

These scripts build .box images that can be used by [vagrant](http://vagrantup.com), the VM manager, and ISO images that can be installed on bare metal.


Building the images
-------------------

First install [packer](http://packer.io) and [virtualbox](https://www.virtualbox.org/)

Then:

```
packer build cycle64-template.json
```

The .box image is now ready to go. Install it into Vagrant via:

```
vagrant box add cycle64 cycle64-virtualbox.box
```


Running the images
------------------

To use the box with vagrant

```
cd /your/project/dir
vagrant init cycle64
vagrant up
vagrant ssh
```

