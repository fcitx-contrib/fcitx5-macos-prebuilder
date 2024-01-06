set -e
. ./common.sh $1
cd json-c

ARGS=(
  -DDISABLE_EXTRA_LIBS=ON
)

f5m_configure "${ARGS[@]}"
f5m_build
f5m_install json-c
f5m_make_tarball json-c
