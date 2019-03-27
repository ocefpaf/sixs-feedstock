#!/bin/bash

export FFLAGS=$(echo "${FFLAGS}" | sed "s/-fopenmp//g")


if [[ $(uname) == Darwin ]]; then
  export FFLAGS=$(echo "${FFLAGS}" | sed "s/-ffpe-summary=none//g")
fi

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX $SRC_DIR

make -j${CPU_COUNT}
make install
