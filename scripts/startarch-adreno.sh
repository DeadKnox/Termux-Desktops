#!/data/data/com.termux/files/usr/bin/bash
# ┌──────────────────────────────────────────────────────┐
# │  startarch-adreno.sh — Arch Linux ARM (Adreno/Zink)  │
# │  github.com/DeadKnox/Termux-Desktops                   │
# └──────────────────────────────────────────────────────┘
# Snapdragon / Adreno — Zink + Turnip
# Usage: bash ~/startarch-adreno.sh

killall -9 termux-x11 pulseaudio 2>/dev/null
rm -f /tmp/.X0-lock /tmp/.X11-unix/X0
sleep 1

pulseaudio --start \
  --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
  --exit-idle-time=-1

termux-x11 :1 &
sleep 2

am start --user 0 -n com.termux.x11/.MainActivity

export XDG_RUNTIME_DIR=${TMPDIR}

proot-distro login archlinux --shared-tmp -- /bin/bash -c \
  'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=/tmp && su - YourUsername -c "env DISPLAY=:1 MESA_LOADER_DRIVER_OVERRIDE=zink TU_DEBUG=noconform MESA_VK_WSI_PRESENT_MODE=mailbox dbus-launch --exit-with-session xfce4-session"'
