FROM fedora:rawhide

RUN dnf -y install gcc gcc-c++ findutils cmake ninja-build boost-devel yaml-cpp-devel python2-sphinx doxygen gettext zanata-client

# Workaround for slow package update
RUN pip install breathe

RUN alternatives --set ld /usr/bin/ld.gold

RUN dnf -y clean all
