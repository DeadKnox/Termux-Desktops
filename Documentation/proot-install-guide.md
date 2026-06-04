# 🐧 How to Install Proot Distros

> Run a full Linux distro on Android without root using `proot-distro`.

---

## What is proot-distro?

`proot-distro` is a Termux package that manages Linux distributions using `proot` — a userspace implementation of chroot. You get a real Linux environment with:

- Full package manager (apt, pacman, apk, dnf...)
- Real filesystem layout
- No root required
- Works alongside Android

---

## Install proot-distro

```bash
pkg install proot-distro
```

---

## Available Distros

List all available distros:

```bash
proot-distro list
```

---

## Install a Distro

```bash
# Debian
proot-distro install debian

# Ubuntu
proot-distro install ubuntu

# Kali Linux (rolling)
proot-distro install kali-nethunter
# or
proot-distro install kalilinux/kali-rolling:latest

# Arch Linux
proot-distro install archlinux

# Alpine Linux
proot-distro install alpine

# Fedora
proot-distro install fedora

# Void Linux
proot-distro install void

# Manjaro (via custom rootfs)
# See: distros/manjaro/README.md

# Artix Linux (via custom rootfs)
# See: distros/artix/README.md
```

---

## Log Into a Distro

```bash
proot-distro login debian
```

With a specific user:

```bash
proot-distro login debian --user youruser
```

---

## After Install

Each distro in this repo has its own guide covering:

1. Creating a non-root user
2. Installing XFCE4 desktop
3. Enabling VirGL acceleration
4. Installing a browser + apps
5. The launch script for Termux

Pick your distro from the [main index](../README.md).

---

<div align="right"><a href="../README.md">← back to index</a></div>
