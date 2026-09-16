# Build and Test

## Build host
Use Debian 13/Trixie WSL or a Debian 13 VM. Do not build the Debian target with Ubuntu's live-build configuration.

## Commands
```bash
sudo ./scripts/preflight.sh
sudo ./scripts/build-iso.sh
```

## Output
`build/CoreOS-1.0-amd64.iso`

## VM test
Use VirtualBox with 4 GB RAM, 2 CPUs and a 30 GB virtual disk. Boot the Live system first. Do not install to physical hardware until networking, graphics, audio, storage and suspend/reboot are tested.

## Hardware test
Later write the ISO to a USB and boot the laptop using the Live system option. Do not install until the hardware test is complete.
