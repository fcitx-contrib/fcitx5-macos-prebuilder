set -e
. ./common.sh $1
cd iso-codes

./configure -C --prefix=$INSTALL_PREFIX
make -j10
DESTDIR=$ROOT/build/iso-codes make install
f5m_make_tarball iso-codes
