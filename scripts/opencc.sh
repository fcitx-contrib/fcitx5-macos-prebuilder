set -e
. ./common.sh $1
cd opencc

ARGS=(-DBUILD_SHARED_LIBS=OFF)

if [[ $ARCH != `uname -m` ]]; then
    sed -i '' 's/add_subdirectory(data)//' CMakeLists.txt
fi

f5m_configure ${ARGS[@]}
f5m_build
f5m_install opencc
f5m_make_tarball opencc
