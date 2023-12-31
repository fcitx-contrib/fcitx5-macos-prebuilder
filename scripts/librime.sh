set -e
. ./common.sh $1
cd librime

ARGS=(
    -DBUILD_MERGED_PLUGINS:BOOL=ON
    -DENABLE_EXTERNAL_PLUGINS:BOOL=OFF
)
export CMAKE_FIND_ROOT_PATH="$ROOT/build/marisa/"
f5m_configure ${ARGS[@]}
f5m_build
f5m_install librime
f5m_make_tarball librime
