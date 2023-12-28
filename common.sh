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

export DESTDIR=`pwd`/build

f5m_configure() {
  cmake -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=$HOMEBREW_PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_FIND_ROOT_PATH="/Library/Input Methods/Fcitx5.app/Contents;$HOMEBREW_PREFIX" \
    -DCMAKE_OSX_ARCHITECTURES=$ARCH "$@"
}

f5m_build() {
  cmake --build build
}

f5m_install() {
  cmake --install build
}
