set -e

all_packages=(
  libxkbcommon
  pcre2
  glib
  json-glib
  libgee
  libskk
  fmt
  json-c
  marisa
  opencc
  zstd
  boost
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
