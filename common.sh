if [[ -z $1 ]]; then
  ARCH=`uname -m`
else
  ARCH=$1
fi
export DESTDIR=`pwd`/build

cbr() {
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_OSX_ARCHITECTURES=$ARCH "$@"
}

cb() {
  cmake --build build
}

ci() {
  cmake --install build
}
