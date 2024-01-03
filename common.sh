ROOT=`pwd`
INSTALL_PREFIX=/tmp/fcitx5 # set it so that pkgconfig points there for plugins to find

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

: "${CMAKE_BUILD_TYPE:=Release}"

f5m_configure() {
  rm -rf build
  # CMAKE_FIND_ROOT_PATH needs HOMEBREW_PREFIX for boost on arm64
  PKG_CONFIG_PATH=$INSTALL_PREFIX/lib/pkgconfig:$HOMEBREW_PREFIX/lib/pkgconfig cmake -B build -G Ninja \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_FIND_ROOT_PATH="/Library/Input Methods/Fcitx5.app/Contents;$HOMEBREW_PREFIX" \
    -DCMAKE_OSX_ARCHITECTURES=$ARCH "$@"
}

f5m_build() {
  cmake --build build
}

f5m_install() {
  cmake --install build # install for other dependencies
  DESTDIR=$ROOT/build/$1 cmake --install build # install for package
}

f5m_make_tarball() {
  cd $ROOT/build/$1$INSTALL_PREFIX
  tar cjvf $ROOT/build/$1-$ARCH.tar.bz2 *
}
