FROM fedora:rawhide

RUN dnf -y install gcc gcc-c++ cmake ninja-build python2-sphinx doxygen breathe boost-devel gettext zanata-client

RUN alternatives --set ld /usr/bin/ld.gold

RUN buildDeps="git" \
	&& dnf -y install $buildDeps \
	&& git clone -b master https://github.com/boostorg/dll boost-dll \
	&& cp -rf boost-dll/include /usr/ \
	&& rm -rf boost-dll \
	&& dnf -y remove $buildDeps

RUN dnf -y clean all
