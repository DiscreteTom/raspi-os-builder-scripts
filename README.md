# raspi-os-builder-scripts

Scripts to build custom raspi image.

## Usage

First, setup pi-gen environment:

```
wget -q https://raw.githubusercontent.com/DiscreteTom/raspi-os-builder-scripts/main/setup-pi-gen.sh && bash setup-pi-gen.sh
```

Then, pick files you want to run in `scripts/` folder, add their contents to `pi-gen/stage2/04-customize/00-run-chroot.sh`.
