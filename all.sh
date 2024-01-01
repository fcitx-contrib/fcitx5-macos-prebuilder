set -e

all_packages=(
  marisa
  libime
  libthai
  librime
)

for package in "${all_packages[@]}"; do
  scripts/$package.sh $1
done
