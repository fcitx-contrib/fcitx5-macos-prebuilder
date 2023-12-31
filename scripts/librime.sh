set -e
. ./common.sh $1
cd librime

# Enable plugins
rime_plugins=(hchunhui/librime-lua lotem/librime-octagram)
for plugin in ${rime_plugins[@]}; do
    bash install-plugins.sh $plugin
done
sed -i "" '/#if RIME_BUILD_SHARED_LIBS/,/#endif/c\
#if RIME_BUILD_SHARED_LIBS\
#define rime_declare_module_dependencies()\
#else\
extern void rime_require_module_core();\
extern void rime_require_module_dict();\
extern void rime_require_module_gears();\
extern void rime_require_module_levers();\
extern void rime_require_module_lua();\
extern void rime_require_module_octagram();\
// link to default modules explicitly when building static library.\
static void rime_declare_module_dependencies() {\
  rime_require_module_core();\
  rime_require_module_dict();\
  rime_require_module_gears();\
  rime_require_module_levers();\
  rime_require_module_lua();\
  rime_require_module_octagram();\
}\
#endif' src/rime_api.cc

# Build librime
ARGS=(
    -DBUILD_TEST:BOOL=OFF
    -DBUILD_MERGED_PLUGINS:BOOL=ON
    -DENABLE_EXTERNAL_PLUGINS:BOOL=OFF
)
export CMAKE_FIND_ROOT_PATH="$ROOT/build/marisa/"
f5m_configure ${ARGS[@]}
f5m_build
f5m_install librime
f5m_make_tarball librime
