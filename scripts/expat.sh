set -e
. ./common.sh $1
cd libexpat
src=expat

ARGS=(
  -DEXPAT_BUILD_TOOLS=OFF
  -DEXPAT_BUILD_EXAMPLES=OFF
  -DEXPAT_BUILD_TESTS=OFF
)

f5m_configure "${ARGS[@]}"
f5m_build
f5m_install expat
f5m_make_tarball expat
