set -e

all_packages=(
  default-icon-theme
  libuv
  libintl
  expat
  libxkbcommon
  pcre2
  glib
  json-glib
  libgee
  libskk
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
  anthy-unicode
)

for package in "${all_packages[@]}"; do
  scripts/$package.sh $1
done
