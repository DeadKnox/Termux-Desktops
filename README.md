<div align="center">

```
 ████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗
    ██╔══╝██╔════╝██╔══██╗████╗ ████║██║   ██║╚██╗██╔╝
    ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║ ╚███╔╝ 
    ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║ ██╔██╗ 
    ██║   ███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗
    ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝
                D E S K T O P S
```

**Run full Linux desktops on Android — no root required**

*Termux · proot-distro · Termux:X11 · VirGL GPU Acceleration*

<br>

[![Stars](https://img.shields.io/github/stars/DeadKnox/Termux-Desktop?style=for-the-badge&color=00ff9f&labelColor=0d0d0d&logo=github)](https://github.com/DeadKnox/Termux-Desktop/stargazers)
[![Forks](https://img.shields.io/github/forks/DeadKnox/Termux-Desktop?style=for-the-badge&color=00ff9f&labelColor=0d0d0d&logo=git)](https://github.com/DeadKnox/Termux-Desktop/forks)
[![License](https://img.shields.io/badge/LICENSE-GPL--3.0-00ff9f?style=for-the-badge&labelColor=0d0d0d)](LICENSE)
[![Platform](https://img.shields.io/badge/PLATFORM-Android-00ff9f?style=for-the-badge&labelColor=0d0d0d&logo=android)](https://termux.dev)

<br>

> *Tested on OnePlus Nord 2 5G · MediaTek Dimensity 1200 · Mali-G77 MC9 · Android 13*

</div>

---

<div align="center">

## ⚡ Quick Start

</div>

```bash
# 1. Install base packages
pkg update && pkg upgrade -y
pkg install x11-repo termux-x11-nightly proot-distro pulseaudio virglrenderer-android

# 2. Install your distro (example: Debian)
proot-distro install debian

# 3. Download launch script
wget https://raw.githubusercontent.com/DeadKnox/Termux-Desktop/main/scripts/startdebian.sh \
  -O ~/startdebian.sh && chmod +x ~/startdebian.sh

# 4. Edit username & launch
nano ~/startdebian.sh   # replace YourUsername
bash ~/startdebian.sh
```

> 📦 New here? Read **[First Steps](Documentation/first-steps.md)** before anything else.

---

<div align="center">

## 🖥️ Environments

</div>

| Environment | Type | XFCE4 | GPU Method | Status |
|:---|:---:|:---:|:---|:---:|
| [**Termux Native**](Documentation/termux-native-desktop.md) | Native | ✅ | llvmpipe / Zink+Turnip | ✅ |
| [**Debian Trixie**](distros/debian/README.md) | proot | ✅ | VirGL · Zink+Turnip | ✅ |
| [**Ubuntu 26.04**](distros/ubuntu/README.md) | proot | ✅ | VirGL · Zink+Turnip | ✅ |
| [**Kali Linux**](distros/kali/README.md) | proot | ✅ | VirGL · Zink+Turnip | ✅ |
| [**Arch Linux**](distros/arch/README.md) | proot | ✅ | VirGL · Zink+Turnip | ✅ |
| [**Fedora 44**](distros/fedora/README.md) | proot | ✅ | VirGL · Zink+Turnip | ✅ |
| [**Alpine Linux**](distros/alpine/README.md) | proot | ✅ | VirGL · Zink+Turnip | ✅ |
| [**Void Linux**](distros/void/README.md) | proot | ✅ | VirGL · Zink+Turnip | 🔜 |
| [**Manjaro**](distros/manjaro/README.md) | proot | ✅ | VirGL · Zink+Turnip | 🔜 |
| [**Artix Linux**](distros/artix/README.md) | proot | ✅ | VirGL · Zink+Turnip | 🔜 |

---

<div align="center">

## 🎮 GPU Support

</div>

| Chipset | GPU | Method | Scripts |
|:---|:---|:---|:---|
| MediaTek / Exynos | Mali | VirGL via `virgl_test_server_android` | `start*.sh` |
| Qualcomm Snapdragon | Adreno 6XX/7XX | Zink + Turnip | `start*-adreno.sh` |

All scripts → [`scripts/`](scripts/)

---

<div align="center">

## 📊 Benchmarks

*glmark2 scores on Mali-G77 MC9 via VirGL*

</div>

```
  Debian  Trixie  ████████████████████░░  62
  Kali    Linux   █████████████████████░  63  
  Alpine  v3.23   █████████████████████░  67
  Ubuntu  26.04   ████████████████████░░  56
```

---

<div align="center">

## 📚 Documentation

</div>

| | Guide |
|:---:|:---|
| 📦 | [First Steps — Termux Base Setup](Documentation/first-steps.md) |
| ⚡ | [Hardware Acceleration — VirGL & Adreno](Documentation/hardware-acceleration.md) |
| 🐧 | [How to Install proot Distros](Documentation/proot-install-guide.md) |
| 🖥️ | [Termux Native Desktop](Documentation/termux-native-desktop.md) |
| ⚠️ | [Known Issues & Fixes](Documentation/known-issues.md) |

---

<div align="center">

## 🤝 Contributing

</div>

Got a working setup for a distro not yet covered? PRs are welcome!

See **[CONTRIBUTING.md](CONTRIBUTING.md)** for guidelines.

---

<div align="center">

*Inspired by [LinuxDroidMaster/Termux-Desktops](https://github.com/LinuxDroidMaster/Termux-Desktops)*

Made with 🖤 by [Knox](https://github.com/DeadKnox) · GPL-3.0

<br>

`// run linux · own your device · touch grass never //`

</div>
