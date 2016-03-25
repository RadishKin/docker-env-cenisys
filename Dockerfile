FROM fedora:rawhide

RUN dnf -y install gcc gcc-c++ cmake ninja-build boost-devel yaml-cpp-devel python2-sphinx doxygen breathe gettext zanata-client

RUN alternatives --set ld /usr/bin/ld.gold

RUN dnf -y clean all
