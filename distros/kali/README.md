# Kali Linux (kali-rolling) — proot Desktop

> Full XFCE4 desktop with VirGL hardware acceleration on Android.  
> Status: 🔧 WIP · glmark2: **63**

---

## Install Kali

```bash
proot-distro install kalilinux/kali-rolling:latest
```

Log in as root:

```bash
proot-distro login kali-nethunter
```

---

## Fix Broken dpkg (Common Issue)

On Kali rolling inside proot, several postinst scripts fail because Android has no systemd/udev. Fix them by stubbing the broken scripts:

```bash
for pkg in systemd-standalone-sysusers udev dbus-system-bus-common polkitd; do
  if [ -f /var/lib/dpkg/info/${pkg}.postinst ]; then
    echo '#!/bin/sh' > /var/lib/dpkg/info/${pkg}.postinst
    chmod +x /var/lib/dpkg/info/${pkg}.postinst
  fi
done

dpkg --configure -a
```

---

## Initial Setup

```bash
apt update && apt upgrade -y
apt install sudo adduser wget curl git nano -y
```

### Create a non-root user

```bash
adduser kali
usermod -aG sudo kali
```

> ⚠️ Running everything as root is not recommended even inside proot.

---

## Install XFCE4 Desktop

```bash
apt install kali-desktop-xfce xfce4-terminal \
  dbus-x11 pulseaudio pavucontrol -y
```

Or minimal:

```bash
apt install xfce4 xfce4-goodies dbus-x11 pulseaudio -y
```

---

## Enable VirGL (Hardware Acceleration)

```bash
apt install mesa-utils libgl1-mesa-dri -y
```

Run in Termux before launch:

```bash
virgl_test_server_android &
```

---

## Install Cybersecurity Tools

Kali's full metapackages:

```bash
# Core tools
apt install kali-tools-top10 -y

# Or individual categories:
apt install kali-tools-web -y          # Web pentesting
apt install kali-tools-wireless -y     # WiFi tools
apt install kali-tools-forensics -y    # Forensics
apt install kali-tools-passwords -y    # Password attacks
apt install kali-tools-exploitation -y # Exploitation
```

Key tools installed with `kali-tools-top10`:
- nmap, metasploit-framework, burpsuite
- aircrack-ng, john, hashcat
- sqlmap, nikto, wireshark

---

## Termux Launch Script

Save as `~/startkali.sh` in **Termux**:

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

# Launch Kali as user kali
proot-distro login kali-nethunter --user kali -- bash -c "
  export DISPLAY=:0
  export PULSE_SERVER=127.0.0.1
  export XDG_RUNTIME_DIR=/tmp
  export GALLIUM_DRIVER=virpipe
  export MESA_GL_VERSION_OVERRIDE=4.0
  dbus-launch --exit-with-session startxfce4
" &

sleep 3
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity
```

```bash
chmod +x ~/startkali.sh
bash ~/startkali.sh
```

---

## WIP — Still Needed

- [ ] Browser install (Firefox ESR or Chromium)
- [ ] Desktop theming
- [ ] Kali NetHunter app integration

---

## Benchmark

```
Device  : OnePlus Nord 2 5G
GPU     : Mali-G77 MC9
Driver  : Mesa virgl (GALLIUM_DRIVER=virpipe)

glmark2 score: 63
```

---

<div align="right"><a href="../../README.md">← back to index</a></div>
