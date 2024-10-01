set -e
. ./common.sh $1
cd default-icon-theme

SETUP_ARGS=(
  --buildtype=release
  --prefix=$INSTALL_PREFIX
)

# 'Hicolor' the default icon theme
meson setup build "${SETUP_ARGS[@]}"
ninja -C build clean
ninja -C build
ninja -C build install
DESTDIR=$ROOT/build/default-icon-theme ninja -C build install
f5m_make_tarball default-icon-theme
