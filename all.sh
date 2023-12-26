set -e
scripts/marisa.sh $1
. ./common.sh $1 # let it set ARCH and HOMEBREW_PREFIX
tar cjvf local-$ARCH.tar.bz2 -C build/$HOMEBREW_PREFIX .
