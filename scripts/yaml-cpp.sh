set -e
. ./common.sh $1
cd yaml-cpp

ARGS=(
  -DYAML_CPP_BUILD_CONTRIB=OFF
  -DYAML_CPP_BUILD_TESTS=OFF
  -DYAML_CPP_BUILD_TOOLS=OFF
)

f5m_configure "${ARGS[@]}"
f5m_build
f5m_install yaml-cpp
f5m_make_tarball yaml-cpp
