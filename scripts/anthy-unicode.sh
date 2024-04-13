set -e
. ./common.sh $1
cd anthy-cmake

f5m_configure "${ARGS[@]}"
f5m_build
f5m_install anthy-unicode
f5m_make_tarball anthy-unicode
