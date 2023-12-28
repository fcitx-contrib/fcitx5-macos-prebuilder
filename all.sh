set -e

all_packages=(
  marisa
  libime
)

for package in "${all_packages[@]}"; do
  scripts/$package.sh $1
done

. ./common.sh $1 # let it set ARCH and HOMEBREW_PREFIX
tar cjvf local-$ARCH.tar.bz2 -C build/$HOMEBREW_PREFIX .
