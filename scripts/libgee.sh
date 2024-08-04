set -e
. ./common.sh $1
PKGNAME=libgee
cd $PKGNAME

# Disable tests
sed -i '' 's/TEST_PROGS += tests/TEST_PROGS +=/' tests/Makefile.am

if [[ ! -f configure ]]; then
  NOCONFIGURE=1 ./autogen.sh
fi

export PKG_CONFIG_PATH="$INSTALL_PREFIX/lib/pkgconfig"
export CFLAGS="-arch $ARCH -Wno-incompatible-function-pointer-types"
export LDFLAGS="-arch $ARCH"
./configure \
  -C \
  --prefix=$INSTALL_PREFIX \
  --host=$ARCH

make -j8

make install
DESTDIR=$ROOT/build/$PKGNAME make install

f5m_make_tarball $PKGNAME
