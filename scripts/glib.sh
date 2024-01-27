set -e
. ./common.sh $1
cd glib

# Make sure glib selects proxy-libintl
sed -i '' "/^libintl_deps = \[\]/,/^glib_conf.set('HAVE_BIND_TEXTDOMAIN_CODESET', have_bind_textdomain_codeset)/c\\
 intl_proj = subproject('proxy-libintl')\\
 intl_dep = intl_proj.get_variable('intl_dep')\\
 libintl_deps = [intl_dep]\\
 glib_conf.set('HAVE_BIND_TEXTDOMAIN_CODESET', true)\\
 " meson.build

SETUP_ARGS=(
  --native-file=../scripts/meson-native-x86_64.ini
  --buildtype=release
  --prefix=$INSTALL_PREFIX
  -Dtests=false
  -Dintrospection=disabled
  --default-library=static
)
if [[ $ARCH == "arm64" ]]; then
  SETUP_ARGS+=(--cross-file=../scripts/meson-cross-arm64.ini)
fi

meson setup build "${SETUP_ARGS[@]}"
ninja -C build clean
ninja -C build
ninja -C build install
DESTDIR=$ROOT/build/glib ninja -C build install
f5m_make_tarball glib
