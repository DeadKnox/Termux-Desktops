#!/data/data/com.termux/files/usr/bin/bash
# ┌─────────────────────────────────────────┐
# │  startfedora.sh — Fedora 44 proot       │
# │  github.com/DeadKnox/Termux-Desktop       │
# └─────────────────────────────────────────┘
# Mali / MediaTek / Exynos — VirGL
# Usage: bash ~/startfedora.sh

pkill -f termux-x11 2>/dev/null
pkill -f pulseaudio 2>/dev/null
pkill -f virgl_test_server 2>/dev/null
sleep 1

virgl_test_server_android &
sleep 1

termux-x11 :1 &
sleep 2

pulseaudio --start \
  --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
  --exit-idle-time=-1

am start --user 0 -n com.termux.x11/.MainActivity

export XDG_RUNTIME_DIR=${TMPDIR}

proot-distro login fedora --shared-tmp -- /bin/bash -c \
  'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=/tmp && su - YourUsername -c "env DISPLAY=:1 GALLIUM_DRIVER=virpipe MESA_GL_VERSION_OVERRIDE=4.0 dbus-launch --exit-with-session xfce4-session"'
