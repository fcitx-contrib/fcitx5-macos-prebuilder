set -e
. ./common.sh $1
cd librime

# Enable plugins
rime_plugins=(hchunhui/librime-lua lotem/librime-octagram)
for plugin in ${rime_plugins[@]}; do
    bash install-plugins.sh $plugin
done

# Work around an upstream mistake. (hchunhui/librime-lua#300)
(cd plugins/lua; sed -i '' 's/LUA_LIBRARIES/LUA_LDFLAGS/' CMakeLists.txt)

# HACK: Force generation of rime.pc
sed -i '' 's/MINGW/APPLE/' CMakeLists.txt

# Build librime
ARGS=(
    -DBUILD_TEST:BOOL=OFF
    -DBUILD_MERGED_PLUGINS:BOOL=ON
    -DENABLE_EXTERNAL_PLUGINS:BOOL=OFF
)
export EXTRA_FIND_ROOT_PATH="$ROOT/build/marisa/"
f5m_configure ${ARGS[@]}
f5m_build
f5m_install librime
f5m_make_tarball librime
