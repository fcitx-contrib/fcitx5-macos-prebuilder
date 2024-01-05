set -e

all_packages=(
  marisa
  opencc
  zstd
  libime
  libthai
  glog
  leveldb
  yaml-cpp
  librime
)

for package in "${all_packages[@]}"; do
  scripts/$package.sh $1
done
