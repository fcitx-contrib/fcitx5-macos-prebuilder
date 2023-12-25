export DESTDIR=`pwd`/build
cbr="cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release"
cb="cmake --build build"
ci="cmake --install build"
