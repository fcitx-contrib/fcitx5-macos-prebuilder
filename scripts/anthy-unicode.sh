set -e
. ./common.sh $1
cd anthy-cmake

f5m_configure
f5m_build
f5m_install anthy-unicode

# Build anthy.dic
pushd anthy-unicode
./autogen.sh
make -j4
ANTHY_DIC_DIR=$ROOT/build/anthy-unicode$INSTALL_PREFIX/share/anthy
mkdir -p $ANTHY_DIC_DIR
touch $ANTHY_DIC_DIR/anthy-unicode.conf # for fcitx5-anthy to locate
cp mkanthydic/anthy.dic $ANTHY_DIC_DIR 
popd

f5m_make_tarball anthy-unicode
