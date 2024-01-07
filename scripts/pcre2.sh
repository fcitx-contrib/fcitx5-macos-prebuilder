set -e
. ./common.sh $1
cd pcre2

if [[ ! -f configure ]]; then
    autoreconf -i
fi

export PKG_CONFIG_PATH="$INSTALL_PREFIX/lib/pkgconfig"
export CFLAGS="-arch $ARCH"
export LDFLAGS="-arch $ARCH"
./configure                    \
    -C                         \
    --prefix=$INSTALL_PREFIX   \
    --host=$ARCH

make -j8

make install
DESTDIR=$ROOT/build/pcre2 make install

f5m_make_tarball pcre2
