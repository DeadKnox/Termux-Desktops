<div align="center">

```
 ████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗
    ██╔══╝██╔════╝██╔══██╗████╗ ████║██║   ██║╚██╗██╔╝
    ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║ ╚███╔╝ 
    ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║ ██╔██╗ 
    ██║   ███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗
    ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝
                  DESKTOPS  //  by _ryuZaki
```

**Run full Linux desktops on Android — no root required.**  
*Termux XII · proot-distro · Termux:X11 · VirGL Hardware Acceleration*

[![GitHub Stars](https://img.shields.io/github/stars/ryuV2/Termux-Desktops?style=flat-square&color=00ff9f&labelColor=0d0d0d)](https://github.com/ryuV2/Termux-Desktops/stargazers)
[![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3.0-00ff9f?style=flat-square&labelColor=0d0d0d)](LICENSE)
[![Platform: Android](https://img.shields.io/badge/platform-Android-00ff9f?style=flat-square&labelColor=0d0d0d)](https://termux.dev)

</div>

---

## `> whoami`

This repo is a collection of scripts and guides to spin up full **XFCE4 Linux desktops** inside **Termux** on Android — with audio, hardware-accelerated graphics (VirGL), and no root needed.

Tested on **OnePlus Nord 2 5G** · MediaTek Dimensity 1200-AI · Mali-G77 MC9 GPU

> If you're new here, start with **[First Steps](Documentation/first-steps.md)** before anything else.

---

## `> ls -la environments/`

| Environment | Type | XFCE4 | VirGL | Status |
|---|---|:---:|:---:|:---:|
| [Termux Native](Documentation/termux-native-desktop.md) | Native | ✅ | ❌ | ✅ Done |
| [Debian Trixie](distros/debian/README.md) | proot | ✅ | ✅ | ✅ Done |
| [Ubuntu 26.04](distros/ubuntu/README.md) | proot | ✅ | ✅ | ✅ Done |
| [Kali Linux](distros/kali/README.md) | proot | ✅ | ✅ | ✅ Done |
| [Arch Linux](distros/arch/README.md) | proot | ✅ | ✅ | 🔜 Soon |
| [Alpine Linux](distros/alpine/README.md) | proot | ✅ | ✅ | 🔜 Soon |
| [Fedora](distros/fedora/README.md) | proot | ✅ | ✅ | 🔜 Soon |
| [Void Linux](distros/void/README.md) | proot | ✅ | ✅ | 🔜 Soon |
| [Manjaro](distros/manjaro/README.md) | proot | ✅ | ✅ | 🔜 Soon |
| [Artix Linux](distros/artix/README.md) | proot | ✅ | ✅ | 🔜 Soon |

---

## `> cat index.md`

- 📦 [First Steps — Termux Base Setup](Documentation/first-steps.md)
- ⚡ [Hardware Acceleration with VirGL](Documentation/hardware-acceleration.md)
- 🖥️ [Termux Native Desktop](Documentation/termux-native-desktop.md)
- 🐧 [How to install proot distros](Documentation/proot-install-guide.md)
- ⚠️ [Known Issues & Fixes](Documentation/known-issues.md)

---

## `> cat glmark2_scores.txt`

Hardware acceleration benchmarks on **Mali-G77 MC9** via `virgl_test_server_android`:

```
Debian  Trixie  ──────────────────────── 62 pts  ✅
Ubuntu  26.04   ───────────────────────  56 pts  ✅
Kali    rolling ─────────────────────── 63 pts  ✅
```

---

## `> ./credits.sh`

Inspired by [LinuxDroidMaster/Termux-Desktops](https://github.com/LinuxDroidMaster/Termux-Desktops) — go check his channel too.

Made by [_ryuZaki](https://github.com/ryuV2) · GPL-3.0

---

<div align="center">

*// run linux. own your device. touch grass never //*

</div>
