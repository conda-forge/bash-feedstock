#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./support

set -ex

flags=()

if ! [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
    flags+=("bash_cv_getcwd_malloc=yes")
fi

./configure --prefix=$PREFIX --with-installed-readline=$PREFIX --without-bash-malloc "${flags[@]}"

make -j${CPU_COUNT}

# if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
#     make tests
# fi

make install
