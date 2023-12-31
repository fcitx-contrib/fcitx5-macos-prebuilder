set -e
. ./common.sh $1
cd opencc

ARGS=(
    -DBUILD_SHARED_LIBS:BOOL=OFF
    -DUSE_SYSTEM_MARISA:BOOL=ON
)

if [[ $ARCH != `uname -m` ]]; then
    sed -i '' 's/add_subdirectory(data)//' CMakeLists.txt
fi

# Use prebuilt marisa-trie
export CMAKE_FIND_ROOT_PATH=$ROOT/build/marisa/$HOMEBREW_PREFIX
cd src
cat >> CMakeLists.txt <<EOF
include_directories($ROOT/build/marisa/$HOMEBREW_PREFIX/include)
EOF
cd -

f5m_configure ${ARGS[@]}
f5m_build
f5m_install opencc
f5m_make_tarball opencc
