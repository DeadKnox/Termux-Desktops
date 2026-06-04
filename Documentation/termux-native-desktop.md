# 🖥️ Termux Native Desktop

> Run an XFCE4 desktop directly in Termux — no proot, no distro install.

---

## What is Termux Native?

Termux Native means running the desktop session directly within the Termux environment — no virtual Linux container. It's the lightest option:

| | Native | proot |
|---|:---:|:---:|
| Needs root | ❌ | ❌ |
| Full Linux distro | ❌ | ✅ |
| Package manager | Termux `pkg` | distro's native |
| VirGL support | ❌ | ✅ |
| Performance | 🚀 Fast | ⚡ Good |

> If you want full distro tools (apt, Kali tools, etc.) — use proot instead.

---

## Install Required Packages

```bash
pkg update && pkg upgrade -y
pkg install x11-repo
pkg install termux-x11-nightly
pkg install pulseaudio
pkg install xfce4
pkg install xfce4-terminal
```

Optional extras:

```bash
pkg install thunar mousepad ristretto xarchiver
```

---

## Launch Script

Save this as `~/startdesktop.sh`:

```bash
#!/bin/bash

# Kill old sessions
pkill -f termux-x11 2>/dev/null
pkill -f pulseaudio 2>/dev/null
sleep 1

# Start display + audio
termux-x11 :0 &
sleep 2
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1

# Launch desktop
DISPLAY=:0 PULSE_SERVER=127.0.0.1 dbus-launch --exit-with-session startxfce4 &

# Open Termux:X11
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity
```

Make it executable:

```bash
chmod +x ~/startdesktop.sh
```

Run it:

```bash
bash ~/startdesktop.sh
```

---

## Notes

- Open **Termux:X11** app after running the script to see your desktop
- Native Termux has limited app compatibility vs a full proot distro
- For hardware-accelerated proot desktops → pick a distro from the [main index](../README.md)

---

<div align="right"><a href="../README.md">← back to index</a></div>
