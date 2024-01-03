set -e
. ./common.sh $1
cd leveldb

ARGS=(
  -DLEVELDB_BUILD_BENCHMARKS=OFF
  -DLEVELDB_BUILD_TESTS=OFF
)

f5m_configure "${ARGS[@]}"
f5m_build
f5m_install leveldb
f5m_make_tarball leveldb
