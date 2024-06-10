set -e
. ./common.sh $1
cd libchewing

git reset --hard
git apply ../patches/libchewing.patch

ARGS=(
  -DWITH_SQLITE3:BOOL=OFF
  -DBUILD_TESTING:BOOL=OFF
  -DWITH_RUST:BOOL=OFF
)
f5m_configure "${ARGS[@]}"
f5m_build
f5m_install libchewing
f5m_make_tarball libchewing
