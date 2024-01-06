set -e
. ./common.sh $1
cd glib

SETUP_ARGS=(
    --buildtype=release
    --prefix=$INSTALL_PREFIX
    -Dtests=false
    -Dintrospection=disabled
    --default-library=static
)
if [[ $ARCH == "arm64" ]]; then
    SETUP_ARGS+=(--cross-file=../scripts/meson-cross-arm64.ini)
fi

meson setup build ${SETUP_ARGS[@]}
ninja -C build clean
ninja -C build
DESTDIR=$ROOT/build/glib ninja -C build install
f5m_make_tarball glib
