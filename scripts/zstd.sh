set -e
. ./common.sh $1
cd zstd
src=build/cmake
build=build-zstd

ARGS=(
  -DZSTD_LEGACY_SUPPORT=OFF
  -DZSTD_BUILD_PROGRAMS=OFF
  -DZSTD_BUILD_TESTS=OFF
  -DZSTD_BUILD_SHARED=OFF
)

f5m_configure "${ARGS[@]}"
f5m_build
f5m_install zstd
f5m_make_tarball zstd
