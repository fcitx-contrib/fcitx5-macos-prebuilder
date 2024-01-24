set -e
. ./common.sh $1
cd default-icon-theme

# 'Hicolor' the default icon theme
autoreconf -i
./configure --prefix="$INSTALL_PREFIX"
make
DESTDIR="$ROOT/build/default-icon-theme" make install
f5m_make_tarball default-icon-theme
