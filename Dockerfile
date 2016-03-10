FROM fedora:rawhide

RUN dnf -y install bzip2 icu gcc gcc-c++ make cmake python2-sphinx doxygen breathe

RUN buildDeps="which git libicu-devel zlib-devel bzip2-devel python-devel" \
	&& dnf -y install $buildDeps \
	&& git clone --recursive https://github.com/boostorg/boost /usr/src/boost \
	&& cd /usr/src/boost \
	&& ./bootstrap.sh \
	&& ./b2 headers \
	&& ./b2 -j"$(nproc)" install \
	&& cd \
	&& rm -rf /usr/src/boost \
	&& dnf -y remove $buildDeps

RUN dnf -y clean all
