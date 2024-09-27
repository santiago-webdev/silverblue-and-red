# Silverblue and Red

This is my personal OCI Fedora Silverblue image

## What comes included

- RPM Fusion repositories (free and non-free)
- Visual Studio Code
- Distrobox
- Codecs for Firefox to work properly
  - FFmpeg
  - Intel Media Driver
- Docker CE
- Battery Conservation Support
    - This is for laptops like the Ideapad or ThinkBook line of laptops
- Removes unnecessary packages
    - I removed unnecessary packages like the Tour and Help applications
  - Docker CE and related tools
  - GNOME browser connector and GNOME Tweaks
  - TuneD and related utilities
    - For better power management
- Automatically update the system

## Why keep Firefox on the image?

- KeePassXC and the browser integration works as a flatpak
- Both of the DEs that I like, (GNOME and KDE Plasma) offer some kind of browser integration
    - Keeping Firefox in the host means I have that integration, it'll let you search through history, tabs and bookmarks
    - In the case of GNOME it'll let you interact with the website for GNOME extensions
- Avoid any kind of conflicts specially when working with scripts, webextensions and containers
- Even if you purge your flatpaks you still have a browser to work with

## How does it work?

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

## Modify system with dconf

This are settings that are more easily configured through the dconf-editor

- `/org/gnome/desktop/wm/preferences/resize-with-right-button`, true: To resize windows with Meta+Right Click
- `/org/gnome/settings-daemon/plugins/media-keys/volume-step`, 1: For a finer control on the volume output
- `/org/gnome/desktop/interface/font-name`, Inter Display 11: This is the general font, it's better than the default
- `/org/gnome/desktop/interface/document-font-name`, Inter Display 11: Same as general font
- `/org/gnome/desktop/interface/monospace-font-name`, Iosevka Term Medium 14: My prefered font for text editors and code
- `/org/gnome/desktop/peripherals/mouse/middle-click-emulation`, True: To emule Middle Click by pressing Left and Right Clicks at the same time
- `/org/gnome/mutter/center-new-windows`, True
- `/org/gnome/desktop/wm/preferences/action-middle-click-titlebar`, minimize
- `/org/gnome/gnome-system-monitor/maximized`, True

## Getting my dotfiles

I use stow, so I stow, run the steps I have to get my shell setup and I reboot to make sure everything is working as expected
