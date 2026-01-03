#!/usr/bin/env bash
# ## Enable ZFS
# #find . -name "PKGBUILD" | xargs -I {} sed -i "s/_build_zfs:=no/_build_zfs:=yes/" {}
# ## Enable Generic v3
# find . -name "PKGBUILD" | xargs -I {} sed -i "s/_processor_opt:=/_processor_opt:=GENERIC_V3/" {}
# find . -name "PKGBUILD" | xargs -I {} sed -i "s/_use_auto_optimization:=yes/_use_auto_optimization:=no/" {}
# ## Enable Open NVIDIA module
# #find . -name "PKGBUILD" | xargs -I {} sed -i "s/_build_nvidia_open:=no/_build_nvidia_open:=yes/" {}
# ## Disable clang-LTO
# find . -name "PKGBUILD" | xargs -I {} sed -i "s/_use_llvm_lto:=thin/_use_llvm_lto:=none/" {}

## GCC v3 Kernel
files=$(find . -name "PKGBUILD")

for f in $files
do
    d=$(dirname $f)
    cd $d
    time podman run --name kernelbuild -e EXPORT_PKG=1 -e SYNC_DATABASE=1 -e CHECKSUMS=1 -v $PWD:/pkg docker.io/jonpetersathan/docker-makepkg-v3
    podman rm kernelbuild
    cd ..
done