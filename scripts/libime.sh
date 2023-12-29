set -e
. ./common.sh $1
cd libime

ARGS=(
  -DENABLE_TEST=OFF
)

if [[ $ARCH != `uname -m` ]]; then
  ARGS+=(-DENABLE_DATA=OFF)
fi

f5m_configure ${ARGS[@]}
f5m_build
f5m_install libime
f5m_make_tarball libime
