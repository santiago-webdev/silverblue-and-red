# IGNORE, THIS IS A WIP

This are my personal OCI ostree images for Fedora Silverblue and Kinoite

## What comes included

- RPM Fusion repositories (free and non-free)
- Visual Studio Code
- Distrobox
- Non-free codecs for Firefox to work properly
  - FFmpeg
  - Intel Media Driver
- Docker CE
- Battery Conservation Mode configs to support this feature that some laptops like the Ideapad or ThinkBook line has
- Removes unnecessary packages
- Docker CE and related tools
- GNOME browser connector and GNOME Tweaks
- Automatically update the system

## Why keep Firefox on the image?

- Both of the DEs that I like, (GNOME and KDE Plasma) offer some kind of browser integration
    - Keeping Firefox in the host means I have that integration, it'll let you search through history, tabs and bookmarks
    - In the case of GNOME it'll let you interact with the website for GNOME extensions
- KeePassXC flatpak version works correctly for browser integration
- Avoid any kind of conflicts specially when working with scripts, webextensions and containers
- Even if you purge your flatpaks you still have a browser to work with

## How does this repo work?

There's a GitHub Action that generates an image everyday, once you rebase to the image
there'll be a timer running in the background that will upgrade to the newly updated image
and you can forget about updating from now on.

## Entire Setup(WIP)

This is just a writeup on how I setup everything

## Get the image

Booting from a Silverblue installation run 

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/santiago-webdev/silverblue-and-red:latest
```

## Change the hostname

## Configure the automounting of a secondary hardrrive

You can do so safely because if something goes wrong you can rollback to the original image, changes to /etc get tracked by ostree

## Getting my dotfiles

I use stow, so I stow, run the steps I have to get my shell setup and I reboot to make sure everything is working as expected
