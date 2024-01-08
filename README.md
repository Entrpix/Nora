# Nora
CLI Tool for Using AUR Packages on Non-Arch Based Distros

## Usage
Run `nora help`

## Installation
Req: Linux, Bash, Curl, Podman, Docker, Distrobox
```sh
$ sudo curl https://entrpix.me/nora/install.sh | bash
```

## Setup
Before using Nora their is setup that needs to be done
1. `distrobox create -i docker.io/library/archlinux -n *Name Here*`
    - This creates a Arch Distrobox Instance
2. `distrbox enter *Name Here*`
3. `sudo pacman -S git base-devel`
    - Tools needed for building [Yay](https://github.com/Jguer/yay)
4. `git clone https://aur.archlinux.org/yay.git`
5. `cd yay`
6. `makepkg -si`
7. `exit`
8.  Now your done setting up Yay run `nora init`
    - Then input the name you choose for your Arch Instance
9. Your done!
    - run `nora help` for usage
  
## Credit
Yay - https://github.com/Jguer/yay
Distrobox - https://github.com/89luca89/distrobox/
