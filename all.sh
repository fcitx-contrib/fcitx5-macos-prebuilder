set -e

all_packages=(
  marisa
  opencc
  libime
  libthai
  librime
)

for package in "${all_packages[@]}"; do
  scripts/$package.sh $1
done
