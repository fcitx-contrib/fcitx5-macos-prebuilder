set -e
. ./common.sh $1
cd opencc

ARGS=(
  -DCMAKE_CXX_FLAGS="-I$INSTALL_PREFIX/include"
  -DUSE_SYSTEM_MARISA:BOOL=ON
)

if [[ $ARCH != `uname -m` ]]; then
  git reset --hard
  sed -i '' 's/add_subdirectory(data)//' CMakeLists.txt
fi

f5m_configure "${ARGS[@]}"
f5m_build
f5m_install opencc
f5m_make_tarball opencc
