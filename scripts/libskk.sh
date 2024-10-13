set -e
. ./common.sh $1
cd libskk

# Fix build without gobject-introspection, disable tools and tests
git apply ../patches/libskk.patch

if [[ ! -f configure ]]; then
  autoreconf -i
fi

export PKG_CONFIG_PATH="$INSTALL_PREFIX/lib/pkgconfig"
export CFLAGS="-arch $ARCH -Wno-int-conversion -Wno-incompatible-function-pointer-types"
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
