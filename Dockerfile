FROM fedora:rawhide

RUN dnf -y install clang clang-analyzer findutils cmake ninja-build boost-devel yaml-cpp-devel doxygen gettext zanata-client

# Workaround for slow package update
RUN pip install sphinx breathe

RUN alternatives --set ld /usr/bin/ld.gold

RUN dnf -y clean all
