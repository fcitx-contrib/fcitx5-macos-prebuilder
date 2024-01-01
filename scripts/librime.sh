set -e
. ./common.sh $1
cd librime

# Enable plugins
rime_plugins=(lua octagram)
pushd plugins
for plugin in ${rime_plugins[@]}; do
  [[ -L "$plugin" ]] || ln -s ../../librime-$plugin $plugin
done
popd

# Work around an upstream mistake. (hchunhui/librime-lua#300)
(cd plugins/lua; sed -i '' 's/LUA_LIBRARIES/LUA_LDFLAGS/' CMakeLists.txt)

# Build librime
ARGS=(
  -DBUILD_TEST:BOOL=OFF
  -DBUILD_MERGED_PLUGINS:BOOL=ON
  -DENABLE_EXTERNAL_PLUGINS:BOOL=OFF
)
f5m_configure ${ARGS[@]}
f5m_build
f5m_install librime
f5m_make_tarball librime
