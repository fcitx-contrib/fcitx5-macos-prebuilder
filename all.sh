set -e

all_packages=(
  libchewing
  libhangul
  iso-codes
  xkeyboard-config
  anthy-unicode
  default-icon-theme
  libuv
  libintl
  expat
  lua
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
