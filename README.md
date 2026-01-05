# CachyOS Kernel for Surface Devices

This repository includes the files needed to build an optimized CachyOS kernel including custom patches for Microsoft Surface devices. The patches are based on the work from the linux-surface repository. The patches have been updated to ensure compatibility with CachyOS's patches.

The updated linux-surface patches used for this kernel can be found here: [jonpetersathan/linux-surface](https://github.com/jonpetersathan/linux-surface)

**NOTE:** The configuration files and prebuilt kernels are optimized for X86_64_v3 instruction sets, this should be fine for most Surface devices, but might not work on very old (1st or 2nd gen) devices.

## Variants

### linux-cachyos-surface

This variant is as close to the original cachyos kernel as possible, it is build using Clang LTO mode `full` with llvm for maximum performance.

### linux-cachyos-surface-lts

This variant is based on the original cachyos lts kernel, but is build with gcc for better stability and support.

## Installation Instructions

### Build from source

To build the kernel and header files from source, run the following commands within CachyOS (or any Arch derivative):

```bash
sudo pacman -S base-devel
git clone https://github.com/jonpetersathan/linux-cachyos-surface
cd linux-cachyos-surface/linux-cachyos-surface
makepkg -si --skipinteg
```

Or alternatively using docker:

```bash
docker run --name kernelbuild -v $PWD:/pkg cachyos/docker-makepkg-v3
sudo pacman -U linux-cachyos-surface-*.pkg.tar.zst
```

**NOTE:** Per default the linux-cachyos-surface kernel is configured in LTO mode `full`, this takes a very long time to compile, since it's essentially disabeling multithreading. This can be changed by updating the following line in the PKGBUILD:
```bash
# Clang LTO mode, only available with the "llvm" compiler - options are "none", "full" or "thin".
# ATTENTION - one of three predefined values should be selected!
# "full: uses 1 thread for Linking, slow and uses more memory, theoretically with the highest performance gains."
# "thin: uses multiple threads, faster and uses less memory, may have a lower runtime performance than Full."
# "thin-dist: Similar to thin, but uses a distributed model rather than in-process: https://discourse.llvm.org/t/rfc-distributed-thinlto-build-for-kernel/85934"
# "none: disable LTO
: "${_use_llvm_lto:=full}"
```

### Install prebuilt packages

You can also just install one of the prebuilt kernels by downloading the kernel and header files from [here](https://github.com/jonpetersathan/linux-cachyos-surface/releases) and run:

```bash
sudo pacman -U linux-cachyos-surface-*.pkg.tar.zst
```

## Acknowledgements

- Maximilian Luz: [surface-linux/surface-linux](https://github.com/linux-surface/linux-surface)
- Peter Lung: [CachyOS/linux-cachyos](https://github.com/CachyOS/linux-cachyos)