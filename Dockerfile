FROM fedora:rawhide

RUN dnf -y upgrade
RUN dnf -y install llvm clang clang-analyzer compiler-rt findutils cmake ninja-build boost-devel yaml-cpp-devel doxygen gettext zanata-client

# Workaround for slow package update
RUN pip install sphinx breathe

# Workaround packaging bug
RUN ln -sf /usr/lib64/clang/3.8.0/lib /usr/lib64/clang/3.8.0/lib/linux

RUN alternatives --set ld /usr/bin/ld.gold

RUN dnf -y clean all
