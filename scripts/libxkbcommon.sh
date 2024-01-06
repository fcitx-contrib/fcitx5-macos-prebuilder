set -e
. ./common.sh $1
cd libxkbcommon

SETUP_ARGS=(
    --buildtype=release
    --prefix=$INSTALL_PREFIX
    --default-library=static
    -Denable-tools=false
    -Denable-x11=false
    -Denable-docs=false
    -Denable-wayland=false
    -Denable-bash-completion=false
)
if [[ $ARCH == "arm64" ]]; then
    SETUP_ARGS+=(--cross-file=../scripts/meson-cross-arm64.ini)
fi

meson setup build ${SETUP_ARGS[@]}
ninja -C build clean
ninja -C build
ninja -C build install
DESTDIR=$ROOT/build/libxkbcommon ninja -C build install
f5m_make_tarball libxkbcommon
