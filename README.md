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
