set -e
. ./common.sh $1
PKGNAME=json-glib
cd $PKGNAME

SETUP_ARGS=(
    --buildtype=release
    --prefix=$INSTALL_PREFIX
    --default-library=static
    -Dtests=false
    -Dgtk_doc=disabled
    -Dintrospection=disabled
)
if [[ $ARCH == "arm64" ]]; then
    SETUP_ARGS+=(--cross-file=$ROOT/scripts/meson-cross-arm64.ini)
fi

meson setup build ${SETUP_ARGS[@]}
ninja -C build clean
ninja -C build
ninja -C build install
DESTDIR=$ROOT/build/$PKGNAME ninja -C build install
f5m_make_tarball $PKGNAME
