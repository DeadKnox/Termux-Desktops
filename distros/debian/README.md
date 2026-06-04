# Debian Trixie — proot Desktop

> Full XFCE4 desktop with VirGL hardware acceleration on Android.  
> Status: ✅ Complete · glmark2: **62**

---

## Install Debian

```bash
proot-distro install debian
```

Log in as root first:

```bash
proot-distro login debian
```

---

## Inside Debian — Initial Setup

### Update & install essentials

```bash
apt update && apt upgrade -y
apt install sudo adduser wget curl git nano -y
```

### Create a non-root user

```bash
adduser synone
usermod -aG sudo synone
```

---

## Install XFCE4 Desktop

```bash
apt install xfce4 xfce4-terminal xfce4-goodies \
  dbus-x11 xorg pulseaudio pavucontrol -y
```

---

## Enable VirGL (Hardware Acceleration)

Install Mesa + virgl drivers:

```bash
apt install mesa-utils libgl1-mesa-dri -y
```

The actual VirGL server runs from Termux (not inside proot):

```bash
# Run this in Termux BEFORE launching the desktop
virgl_test_server_android &
```

These env vars are set in the launch script automatically:

```bash
export GALLIUM_DRIVER=virpipe
export MESA_GL_VERSION_OVERRIDE=4.0
```

Verify after desktop starts:

```bash
glxinfo | grep "OpenGL renderer"
# Expected: virgl (Mali-G77) or similar
```

---

## Add Kali Rolling Repo (for security tools)

```bash
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" \
  > /etc/apt/sources.list.d/kali.list

wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add -
apt update
```

---

## Install Cybersecurity Tools

```bash
apt install -y \
  nmap netcat-openbsd wireshark hydra sqlmap nikto \
  dirb gobuster john hashcat aircrack-ng exploitdb \
  tor proxychains4 steghide binwalk foremost \
  netdiscover arp-scan sslscan wfuzz ffuf
```

---

## Install Firefox ESR

```bash
apt install firefox-esr -y
xdg-settings set default-web-browser firefox-esr.desktop
```

---

## Termux Launch Script

Save this as `~/startdebian.sh` in **Termux** (not inside proot):

```bash
#!/bin/bash

# Kill old sessions
pkill -f termux-x11 2>/dev/null
pkill -f pulseaudio 2>/dev/null
pkill -f virgl 2>/dev/null
sleep 1

# Start services
termux-x11 :0 &
sleep 2
pulseaudio --start \
  --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
  --exit-idle-time=-1
virgl_test_server_android &
sleep 1

# Launch Debian as user synone
proot-distro login debian --user synone -- bash -c "
  export DISPLAY=:0
  export PULSE_SERVER=127.0.0.1
  export XDG_RUNTIME_DIR=/tmp
  export GALLIUM_DRIVER=virpipe
  export MESA_GL_VERSION_OVERRIDE=4.0
  dbus-launch --exit-with-session startxfce4
" &

# Open Termux:X11
sleep 3
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity
```

```bash
chmod +x ~/startdebian.sh
bash ~/startdebian.sh
```

---

## Optional — Theming

Tested themes (from gnome-look.org):

| Theme | Type | Notes |
|---|---|---|
| Lavanda-Dark-Compact-Tokyonight | GTK | Previously active |
| WhiteSur-Dark | GTK | Clean macOS-like |
| Colloid-Dark | GTK | Flat, modern |

Apply via **XFCE4 Appearance Settings**.

---

## Benchmark

```
Device  : OnePlus Nord 2 5G
GPU     : Mali-G77 MC9
Driver  : Mesa virgl (GALLIUM_DRIVER=virpipe)

glmark2 score: 62
```

---

<div align="right"><a href="../../README.md">← back to index</a></div>
