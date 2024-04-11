set -e
. ./common.sh $1
cd libintl-lite

git reset --hard
git apply ../patches/libintl.patch

f5m_configure
f5m_build
f5m_install libintl
f5m_make_tarball libintl
