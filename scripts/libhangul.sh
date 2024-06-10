set -e
. ./common.sh $1
cd libhangul

git reset --hard
git apply ../patches/libhangul.patch
cp ../patches/libhangul.pc.in .

ARGS=(
  -DENABLE_EXTERNAL_KEYBOARDS:BOOL=OFF
  -DENABLE_UNIT_TEST:BOOL=OFF
)
f5m_configure "${ARGS[@]}"
f5m_build
f5m_install libhangul
f5m_make_tarball libhangul
