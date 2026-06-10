#!/data/data/com.termux/files/usr/bin/bash
# ┌────────────────────────────────────────────────────────┐
# │  startalpine-adreno.sh — Alpine Linux (Adreno/Zink)    │
# │  github.com/ryuV2/Termux-Desktops                      │
# └────────────────────────────────────────────────────────┘
# Snapdragon / Adreno — Zink + Turnip
# Usage: bash ~/startalpine-adreno.sh

pkill -f termux-x11 2>/dev/null
pkill -f pulseaudio 2>/dev/null
sleep 1

termux-x11 :1 &
sleep 2

pulseaudio --start \
  --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
  --exit-idle-time=-1

am start --user 0 -n com.termux.x11/.MainActivity

export XDG_RUNTIME_DIR=${TMPDIR}

proot-distro login alpine --shared-tmp -- /bin/bash -c \
  'mkdir -p /run/dbus && dbus-daemon --system 2>/dev/null; export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=/tmp && export PATH=$PATH:/sbin && su - YourUsername -c "env DISPLAY=:1 MESA_LOADER_DRIVER_OVERRIDE=zink TU_DEBUG=noconform MESA_VK_WSI_PRESENT_MODE=mailbox dbus-launch --exit-with-session xfce4-session"'
