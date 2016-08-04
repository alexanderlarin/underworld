# Building .deb package

## Create unsigned package

```
    ./make_deb_orig.sh
    cd underworld
    debuild -us -uc
```

## Create package in pbuilder

Create chroot and login to it:

```
    DISTRO=wheezy   # or another debian distribution
    ARCH=amd64      # or i386
    BASETGZ=/var/cache/pbuilder/$DISTRO-$ARCH-fpc.tgz
    sudo pbuilder create --basetgz $BASETGZ --distribution $DISTRO --architecture $ARCH
    sudo pbuilder login --save-after-login --basetgz $BASETGZ
```

Inside chroot run:

```
    apt-get install fpc
    exit
```

Then run on host:

```
    ./make_deb_orig.sh 
    cd underworld
    pdebuild -- --basetgz $BASETGZ
```

Results will be put in /var/cache/pbuilder/result.
