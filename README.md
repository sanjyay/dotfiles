# My dotfiles 

## This is for Arch Linux

```
pacman -S git stow

```
## To run tmux

```
pacman -S tmux

## To install miniconda3(conda) 

https://www.anaconda.com/docs/getting-started/miniconda/install#linux

```
```
mkdir -p ~/build/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/build/miniconda3/miniconda.sh
bash ~/build/miniconda3/miniconda.sh -b -u -p ~/build/miniconda3
rm ~/build/miniconda3/miniconda.sh
```

## Grub Command

```
nvme_core.default_ps_max_latency_us=0 pcie_aspm=off
```

## Firefox Fullscreen within window 

Search about:config in the url bar

```
full-screen-api.ignore-widgets
```
toggle to true
