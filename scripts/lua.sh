set -e
. ./common.sh $1
cd lua

make clean
make a CFLAGS="-O3 -arch ${ARCH}"

include_dir=$ROOT/build/lua$INSTALL_PREFIX/include
lib_dir=$ROOT/build/lua$INSTALL_PREFIX/lib
mkdir -p $include_dir/lua $lib_dir/pkgconfig

cp lua.h luaconf.h lualib.h lauxlib.h $ROOT/patches/lua.hpp $include_dir/lua
cp liblua.a $lib_dir
cp $ROOT/patches/lua.pc $lib_dir/pkgconfig

mkdir -p $INSTALL_PREFIX
cp -r $include_dir $lib_dir $INSTALL_PREFIX

f5m_make_tarball lua
