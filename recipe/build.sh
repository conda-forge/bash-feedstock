#!/bin/bash

set -ex

./configure --prefix=$PREFIX --with-installed-readline=$PREFIX

make

make tests

make install
