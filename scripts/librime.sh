set -e
. ./common.sh $1
cd librime

git reset --hard
git apply ../patches/librime.patch

# Enable plugins
rime_plugins=(lua octagram predict)
pushd plugins
for plugin in "${rime_plugins[@]}"; do
  [[ -L "$plugin" ]] || ln -s ../../librime-$plugin $plugin
done
popd

# Build librime
ARGS=(
  -DBUILD_TEST:BOOL=OFF
  -DBUILD_MERGED_PLUGINS:BOOL=ON
  -DENABLE_EXTERNAL_PLUGINS:BOOL=OFF
)
f5m_configure "${ARGS[@]}"
f5m_build
f5m_install librime
f5m_make_tarball librime
