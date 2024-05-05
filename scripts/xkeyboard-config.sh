set -e
. ./common.sh $1
cd xkeyboard-config

SETUP_ARGS=(
  --native-file=../scripts/meson-native-x86_64.ini
  --buildtype=release
  --prefix=$INSTALL_PREFIX
  --default-library=static
)

meson setup build "${SETUP_ARGS[@]}"
ninja -C build clean
ninja -C build
ninja -C build install
DESTDIR=$ROOT/build/xkeyboard-config ninja -C build install
f5m_make_tarball xkeyboard-config
