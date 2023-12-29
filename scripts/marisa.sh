set -e
. ./common.sh $1
cd marisa-trie
f5m_configure
f5m_build
f5m_install marisa
f5m_make_tarball marisa
