#!/bin/bash

PYTHON_VERSIONS="3.8 3.9 3.10 3.11 3.12 3.13"

for version in $PYTHON_VERSIONS; do
    echo "Building wheel for Python $version"
    python"$version" -m pip wheel . -w dist
done

# exclude all the cuda 12 and 13 libaries
auditwheel repair dist/*.whl --exclude libcudart.so.12 --exclude libcudart.so.13 --exclude libcublas.so.12 --exclude libcublas.so.13 --exclude libcublasLt.so.12 --exclude libcublasLt.so.13 --exclude libcufft.so.12 --exclude libcufft.so.13 --exclude libcusparse.so.12 --exclude libcusparse.so.13 --exclude libcusparseLt.so.0 --exclude libcurand.so.10 --exclude libcupti.so.12 --exclude libcupti.so.13 --exclude libcudnn.so.8 --exclude libnccl.so.2 --exclude libnvrtc.so.12 --exclude libnvrtc.so.13 --exclude libnvJitLink.so.12 --exclude libnvJitLink.so.13 --exclude libnvToolsExt.so.1 --exclude libcuda.so.1 --exclude libtorch.so --exclude libtorch_cpu.so --exclude libtorch_cuda.so --exclude libtorch_python.so --exclude libc10.so --exclude libc10_cuda.so --exclude libgomp.so.1 --exclude libshm.so -w wheelhouse
