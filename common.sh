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

cbr() {
  cmake -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=$HOMEBREW_PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_OSX_ARCHITECTURES=$ARCH "$@"
}

cb() {
  cmake --build build
}

ci() {
  cmake --install build
}
