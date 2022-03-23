#!/bin/bash

if [[ ${CUDNN_VERSION} == 8 ]]; then
    # cuDNN license: https://developer.nvidia.com/cudnn/license_agreement
    mkdir tmp_cudnn && cd tmp_cudnn
    CUDNN_NAME="cudnn-linux-x86_64-8.3.2.44_cuda11.5-archive"
    curl -OLs  https://developer.download.nvidia.com/compute/redist/cudnn/v8.3.2/local_installers/11.5/${CUDNN_NAME}.tar.xz
    tar xf ${CUDNN_NAME}.tar.xz
    cp -a ${CUDNN_NAME}/include/* /usr/local/cuda/include/
    cp -a ${CUDNN_NAME}/lib/* /usr/local/cuda/lib64/
    chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*
    cd ..
    rm -rf tmp_cudnn
    ldconfig
fi
