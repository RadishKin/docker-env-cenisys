FROM fedora:rawhide

RUN dnf -y install icu gcc gcc-c++ cmake python3-sphinx

RUN buildDeps="which git libicu-devel zlib-devel" \
	&& dnf -y install $buildDeps \
	&& git clone --recursive https://github.com/boostorg/boost /usr/src/boost \
	&& cd /usr/src/boost \
	&& ./bootstrap.sh \
	&& ./b2 -j"$(nproc)" install \
	&& cd \
	&& rm -rf /usr/src/boost \
	&& dnf -y remove $buildDeps

RUN dnf -y clean all
