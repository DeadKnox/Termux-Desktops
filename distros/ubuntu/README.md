# Ubuntu 26.04 — proot Desktop

> Full XFCE4 desktop with VirGL hardware acceleration on Android.  
> Status: ✅ Complete · glmark2: **56**

---

## Install Ubuntu

```bash
proot-distro install ubuntu
```

Log in as root:

```bash
proot-distro login ubuntu
```

---

## Inside Ubuntu — Initial Setup

```bash
apt update && apt upgrade -y
apt install sudo adduser wget curl git nano zsh -y
```

### Create a non-root user

```bash
adduser ryuzaki
usermod -aG sudo ryuzaki
```

---

## Install XFCE4 Desktop

```bash
apt install xfce4 xfce4-terminal xfce4-goodies \
  dbus-x11 xorg pulseaudio pavucontrol -y
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

## Add Kali Rolling Repo + Ubuntu Universe

For extra tools:

```bash
# Kali rolling
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" \
  > /etc/apt/sources.list.d/kali.list
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add -

# Ubuntu universe (if not already enabled)
apt install software-properties-common -y
add-apt-repository universe

apt update
```

---

## Install Dev Tools + Zsh Setup

```bash
apt install build-essential python3 python3-pip nodejs npm -y

# Zsh + Oh My Zsh
apt install zsh -y
chsh -s $(which zsh) ryuzaki

# As user ryuzaki:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

---

## Termux Launch Script

Save as `~/startubuntu.sh` in **Termux**:

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

# Launch Ubuntu as user ryuzaki
proot-distro login ubuntu --user ryuzaki -- bash -c "
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
chmod +x ~/startubuntu.sh
bash ~/startubuntu.sh
```

---

## Benchmark

```
Device  : OnePlus Nord 2 5G
GPU     : Mali-G77 MC9
Driver  : Mesa virgl (GALLIUM_DRIVER=virpipe)

glmark2 score: 56
```

---

<div align="right"><a href="../../README.md">← back to index</a></div>
