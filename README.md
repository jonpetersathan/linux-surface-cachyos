# CachyOS Kernel for Surface Devices

This repository includes the files needed to build an optimized CachyOS kernel including custom patches for Microsoft Surface devices. The patches are based on the work from the linux-surface repository. The patches have been updated to ensure compatibility with CachyOS's patches.

The updated linux-surface patches used for this kernel can be found here: [jonpetersathan/linux-surface](https://github.com/jonpetersathan/linux-surface)

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

### Install prebuilt packages

You can also just install one of the prebuilt kernels by downloading the kernel and header files from [here](https://github.com/jonpetersathan/linux-cachyos-surface/releases) and run:

```bash
sudo pacman -U linux-cachyos-surface-*.pkg.tar.zst
```

## Acknowledgements

- Maximilian Luz: [surface-linux/surface-linux](https://github.com/linux-surface/linux-surface)
- Peter Lung: [CachyOS/linux-cachyos](https://github.com/CachyOS/linux-cachyos)