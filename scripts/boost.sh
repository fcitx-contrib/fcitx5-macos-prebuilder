set -e
. ./common.sh $1

boost_version="1.85.0"

boost_dir="boost-$boost_version"
boost_tar="$boost_dir.tar.xz"
[[ -f $boost_tar ]] || wget https://github.com/boostorg/boost/releases/download/$boost_dir/$boost_tar
[[ -d $boost_dir ]] || tar xJf $boost_tar

cd $boost_dir

ARGS=(
  -DBOOST_INCLUDE_LIBRARIES="algorithm;bimap;container;crc;interprocess;iostreams;multi_index;ptr_container;scope_exit;signals2;uuid"
  -DBOOST_IOSTREAMS_ENABLE_BZIP2=Off
  -DBOOST_IOSTREAMS_ENABLE_ZLIB=Off
  -DBOOST_IOSTREAMS_ENABLE_LZMA=Off
  -DBOOST_IOSTREAMS_ENABLE_ZSTD=Off
)

f5m_configure "${ARGS[@]}"
f5m_build
f5m_install boost
f5m_make_tarball boost
