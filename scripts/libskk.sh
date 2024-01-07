set -e
. ./common.sh $1
cd libskk

# Disable tools and tests
sed -i '' 's/SUBDIRS = .*/SUBDIRS = libskk rules po/' Makefile.am

# Fix upstream libskk.pc
cp ../patches/libskk.pc.in libskk/libskk.pc.in

if [[ ! -f configure ]]; then
  autoreconf -i
fi

export PKG_CONFIG_PATH="$INSTALL_PREFIX/lib/pkgconfig"
export CFLAGS="-arch $ARCH"
export LDFLAGS="-arch $ARCH"
export XDG_DATA_DIRS="$INSTALL_PREFIX/share"
./configure \
  -C \
  --prefix=$INSTALL_PREFIX \
  --host=$ARCH \
  --disable-docs
make -j8
make install
DESTDIR=$ROOT/build/libskk make install

f5m_make_tarball libskk
