ROOT=`pwd`

if [[ -z $1 ]]; then
  ARCH=`uname -m`
else
  ARCH=$1
fi

if [[ $ARCH == x86_64 ]]; then
  HOMEBREW_PREFIX=/usr/local
else
  HOMEBREW_PREFIX=/opt/homebrew
fi

f5m_configure() {
  PKG_CONFIG_PATH=$HOMEBREW_PREFIX/lib/pkgconfig cmake -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=$HOMEBREW_PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_FIND_ROOT_PATH="/Library/Input Methods/Fcitx5.app/Contents;$HOMEBREW_PREFIX" \
    -DCMAKE_OSX_ARCHITECTURES=$ARCH "$@"
}

f5m_build() {
  cmake --build build
}

f5m_install() {
  DESTDIR=$ROOT/build/$1 cmake --install build
}

f5m_make_tarball() {
  cd $ROOT/build/$1/usr/local
  tar cjvf $ROOT/build/$1-$ARCH.tar.bz2 *
}
