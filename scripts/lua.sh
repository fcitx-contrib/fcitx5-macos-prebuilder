set -e
. ./common.sh $1
cd lua

make clean
make a CFLAGS="-O3 -arch ${ARCH}"

include_dir=$ROOT/build/lua$INSTALL_PREFIX/include
lib_dir=$ROOT/build/lua$INSTALL_PREFIX/lib
mkdir -p $include_dir $lib_dir

cp lua.h luaconf.h lualib.h lauxlib.h $include_dir
cp $ROOT/patches/lua.hpp $include_dir
cp liblua.a $lib_dir

f5m_make_tarball lua
