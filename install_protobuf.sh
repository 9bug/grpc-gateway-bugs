#!/bin/bash

set -euo pipefail

protobuf_url='https://github.com/google/protobuf/archive/v3.0.0.tar.gz'
protobuf3_dir=~/protobuf3
mkdir -p "$protobuf3_dir"

sudo apt-get install -y --no-install-recommends \
        curl \
        dh-autoreconf \
        unzip

wget "$protobuf_url" -O protobuf3.tar.gz
tar -xzf protobuf3.tar.gz -C $protobuf3_dir --strip 1
rm protobuf3.tar.gz
pushd $protobuf3_dir
./autogen.sh
./configure --prefix=/usr
make
make install
popd
