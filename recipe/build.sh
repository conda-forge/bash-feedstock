#!/bin/bash

set -ex

./configure --prefix=$PREFIX --with-installed-readline=$PREFIX

make -j${CPU_COUNT}

make tests

make install
