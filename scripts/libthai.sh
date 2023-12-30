set -e
. ./common.sh $1
cd libthai

cp ../patches/libthai.cmake CMakeLists.txt
f5m_configure
f5m_build
f5m_install libthai
f5m_make_tarball libthai
