set -e

all_packages=(
  libxkbcommon
  pcre2
  glib
  json-glib
  libgee
  libskk
)

for package in "${all_packages[@]}"; do
  scripts/$package.sh $1
done
