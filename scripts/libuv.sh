set -e
. ./common.sh $1
cd libuv

git reset --hard
git apply ../patches/libuv.patch

ARGS=(
  -DLIBUV_BUILD_SHARED=OFF
  -DLIBUV_BUILD_TESTS=OFF
)

f5m_configure "${ARGS[@]}"
f5m_build
f5m_install libuv
f5m_make_tarball libuv
