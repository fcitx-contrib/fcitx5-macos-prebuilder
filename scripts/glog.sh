set -e
. ./common.sh $1
cd glog

ARGS=(
  -DWITH_GFLAGS=OFF
  -DWITH_UNWIND=OFF
  -DBUILD_TESTING=OFF
)

f5m_configure "${ARGS[@]}"
f5m_build
f5m_install glog
f5m_make_tarball glog
