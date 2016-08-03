# Building rpm package

## Using mock

```
    ./make_rpm_orig.sh
    rpmbuild --define "_topdir `pwd`" -bs SPECS/underworld.spec
    RELEASE=fedora-18-x86_64 # or other
    mock -r $RELEASE rebuild SRPMS/underworld-1.0-1.src.rpm --resultdir RPMS
```
