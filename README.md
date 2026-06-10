<div align="center">

```
 ████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗
    ██╔══╝██╔════╝██╔══██╗████╗ ████║██║   ██║╚██╗██╔╝
    ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║ ╚███╔╝ 
    ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║ ██╔██╗ 
    ██║   ███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗
    ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝
```

### Run full Linux desktops on Android — no root required
*Termux · proot-distro · Termux:X11 · VirGL GPU Acceleration*

[![Stars](https://img.shields.io/github/stars/ryuV2/Termux-Desktops?style=flat-square&color=00ff9f&labelColor=0d0d0d)](https://github.com/ryuV2/Termux-Desktops/stargazers)
[![Forks](https://img.shields.io/github/forks/ryuV2/Termux-Desktops?style=flat-square&color=00ff9f&labelColor=0d0d0d)](https://github.com/ryuV2/Termux-Desktops/forks)
[![License](https://img.shields.io/badge/license-GPL--3.0-00ff9f?style=flat-square&labelColor=0d0d0d)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Android-00ff9f?style=flat-square&labelColor=0d0d0d)](https://termux.dev)
[![Maintained](https://img.shields.io/badge/maintained-yes-00ff9f?style=flat-square&labelColor=0d0d0d)](https://github.com/ryuV2/Termux-Desktops/commits/main)

</div>

---

## `> cat about.txt`

A collection of scripts and step-by-step guides to run **full XFCE4 Linux desktops** on Android using Termux — with audio, hardware-accelerated graphics, and zero root access required.

**Tested on:** OnePlus Nord 2 5G · MediaTek Dimensity 1200-AI · Mali-G77 MC9 · Android 13

> New here? Start with **[📦 First Steps](Documentation/first-steps.md)** before anything else.

---

## `> ls -la environments/`

| Environment | Type | XFCE4 | GPU Method | Status |
|---|---|:---:|---|:---:|
| [Termux Native](Documentation/termux-native-desktop.md) | Native | ✅ | llvmpipe / Zink+Turnip (Adreno) | ✅ Done |
| [Debian Trixie](distros/debian/README.md) | proot | ✅ | VirGL (Mali) · Zink+Turnip (Adreno) | ✅ Done |
| [Ubuntu 26.04](distros/ubuntu/README.md) | proot | ✅ | VirGL (Mali) · Zink+Turnip (Adreno) | ✅ Done |
| [Kali Linux](distros/kali/README.md) | proot | ✅ | VirGL (Mali) · Zink+Turnip (Adreno) | ✅ Done |
| [Arch Linux](distros/arch/README.md) | proot | ✅ | VirGL (Mali) · Zink+Turnip (Adreno) | ✅ Done |
| [Alpine Linux](distros/alpine/README.md) | proot | ✅ | VirGL (Mali) · Zink+Turnip (Adreno) | ✅ Done |
| [Fedora](distros/fedora/README.md) | proot | ✅ | VirGL (Mali) · Zink+Turnip (Adreno) | ✅ Done |
| [Void Linux](distros/void/README.md) | proot | ✅ | VirGL (Mali) · Zink+Turnip (Adreno) | 🔜 Soon |
| [Manjaro](distros/manjaro/README.md) | proot | ✅ | VirGL (Mali) · Zink+Turnip (Adreno) | 🔜 Soon |
| [Artix Linux](distros/artix/README.md) | proot | ✅ | VirGL (Mali) · Zink+Turnip (Adreno) | 🔜 Soon |

---

## `> cat gpu_support.txt`

| Your Device | Chipset | GPU | Method | Script suffix |
|---|---|---|---|---|
| Most MediaTek / Samsung | Dimensity / Exynos | Mali | VirGL | *(default)* |
| Most Snapdragon | Qualcomm | Adreno | Zink + Turnip | `-adreno` |

**Mali users** → use the default scripts: `startdebian.sh`  
**Adreno users** → use the Adreno scripts: `startdebian-adreno.sh`

All scripts are in the [`scripts/`](scripts/) folder.

---

## `> cat glmark2_scores.txt`

GPU acceleration benchmarks on **Mali-G77 MC9** via VirGL:

```
Debian  Trixie   ──────────────────────── 62 pts  ✅
Ubuntu  26.04    ──────────────────────── 56 pts  ✅
Kali    rolling  ──────────────────────── 63 pts  ✅
Alpine  v3.23    ──────────────────────── 67 pts  ✅
```

---

## `> cat index.md`

| | Link |
|---|---|
| 📦 | [First Steps — Termux Base Setup](Documentation/first-steps.md) |
| ⚡ | [Hardware Acceleration (VirGL + Adreno)](Documentation/hardware-acceleration.md) |
| 🐧 | [How to install proot distros](Documentation/proot-install-guide.md) |
| 🖥️ | [Termux Native Desktop](Documentation/termux-native-desktop.md) |
| ⚠️ | [Known Issues & Fixes](Documentation/known-issues.md) |

---

## `> cat quickstart.sh`

```bash
# 1. Install base packages in Termux
pkg update && pkg upgrade -y
pkg install x11-repo termux-x11-nightly proot-distro pulseaudio virglrenderer

# 2. Install your distro
proot-distro install debian   # or ubuntu, kali-nethunter, etc.

# 3. Download launch script (Mali/VirGL)
wget https://raw.githubusercontent.com/ryuV2/Termux-Desktops/main/scripts/startdebian.sh \
  -O ~/startdebian.sh
chmod +x ~/startdebian.sh

# 4. Edit your username inside the script
nano ~/startdebian.sh   # replace YourUsername

# 5. Launch!
bash ~/startdebian.sh
```

---

## `> cat contributing.txt`

Contributions are welcome! If you've got a working setup for a distro not yet covered:

1. Fork the repo
2. Add your guide to `distros/YOURDISTRO/README.md`
3. Add your script to `scripts/`
4. Open a Pull Request

---

## `> ./credits.sh`

Inspired by [LinuxDroidMaster/Termux-Desktops](https://github.com/LinuxDroidMaster/Termux-Desktops)

Made with 🖤 by [_ryuZaki](https://github.com/ryuV2) · GPL-3.0

---

<div align="center">

*`// run linux. own your device. touch grass never //`*

</div>
