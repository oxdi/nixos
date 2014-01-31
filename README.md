OS Image build scripts
======================

Cycle's OS is based on [NixOS](http://nixos.org), a linux distribution with a purely functional
package manager. 

These scripts build .box images that can be used by [vagrant](http://vagrantup.com) for development, and other images suitable for production.

See [CycleSDK](https://bitbucket.org/oxdi/cycle-sdk) for the complete development environment (which makes use of the images generated here).


Building the images
-------------------

First install [packer](http://packer.io) and [virtualbox](https://www.virtualbox.org/)

Then:

```bash
packer build template.json
```

The .box image is now ready to go. Install it into Vagrant via:

Updating the public box image
-----------------------------

`s3put` is handy tool for copying files to Amazon S3, it's part of the [boto](https://github.com/boto/boto) library.

Install boto:

```bash
pip install boto
```

Push the .box image to S3 via s3put

```bash
s3put -a $AWS_ID -s $AWS_KEY -b oxdi -g public-read --prefix `pwd` cycle-xx.xx-x86_64-virtualbox.box
```

The box will then be available at http://amazonaws.com/oxdi/cycle64-virtualbox.box
