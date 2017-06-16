#!/bin/bash
set -x
set -e

if [ "x${LIBSODIUM}" == "x" ]; then
	echo "libsodium build is not required. Skipping."
	exit 0
fi

cd /tmp
git clone git://github.com/jedisct1/libsodium.git
cd libsodium
git checkout ${LIBSODIUM}
./autogen.sh
./configure --disable-dependency-tracking
sudo make -j 2 install
sudo ldconfig

cd /tmp
git clone git://github.com/jedisct1/dnscrypt-proxy.git
cd dnscrypt-proxy
git checkout ${DNSCRYPT_PROXY}
./autogen.sh
./configure
make -j 2
sudo make install
cd ${TRAVIS_BUILD_DIR}
