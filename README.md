# raspi-os-builder-scripts

Scripts to build custom raspi image.

## Usage

First, clone this repo:

```
git clone https://github.com/DiscreteTom/raspi-os-builder-scripts.git
```

Then, setup pi-gen environment:

```
bash raspi-os-builder-scripts/setup-pi-gen.sh
```

Next, pick files you want to run in `scripts/` folder, add their contents to `pi-gen/stage2/04-customize/00-run-chroot.sh`.

For example:

```
cat raspi-os-builder-scripts/scripts/prepare-packages.sh >> pi-gen/stage2/04-customize/00-run-chroot.sh
```
