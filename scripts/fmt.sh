set -e
. ./common.sh $1
cd fmt

ARGS=(
  -DFMT_TEST=OFF
  -DFMT_DOC=OFF
)

f5m_configure "${ARGS[@]}"
f5m_build
f5m_install fmt
f5m_make_tarball fmt
