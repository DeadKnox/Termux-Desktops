# 📦 First Steps

> Get your Termux environment ready before installing any desktop.

---

## Required Packages

Open Termux and run these commands:

```bash
pkg update && pkg upgrade -y

pkg install x11-repo
pkg install termux-x11-nightly
pkg install pulseaudio
pkg install proot-distro
pkg install tur-repo
pkg install wget
pkg install git
```

---

## Install virgl_test_server (Hardware Acceleration)

VirGL lets your proot distros use your Android GPU (Mali, Adreno, etc.) for accelerated OpenGL.

```bash
pkg install virglrenderer-android
```

> ⚠️ This is what gives you a smooth desktop experience. Don't skip it.  
> See the full guide → [Hardware Acceleration](hardware-acceleration.md)

---

## Install Termux:X11

Termux:X11 is the display server (shows your Linux desktop on Android).

- Download the **latest APK** from: https://github.com/termux/termux-x11/releases
- Install it on your Android device alongside Termux

---

## Termux:X11 Preferences (Important)

Open the Termux:X11 app and set:

| Setting | Value |
|---|---|
| Display resolution mode | `exact` |
| Exact width | `1280` (or your screen width) |
| Exact height | `720` (or your screen height) |
| Show additional keyboard | Off |
| Fullscreen on device display | On |

---

## Next Steps

Now pick your environment:

- 🖥️ [Termux Native Desktop](termux-native-desktop.md) — lightest option, no proot
- 🐧 [Install a proot distro](proot-install-guide.md) — full Linux distro, recommended

---

<div align="right"><a href="../README.md">← back to index</a></div>
