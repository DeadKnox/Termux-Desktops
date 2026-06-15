#!/data/data/com.termux/files/usr/bin/bash
# ┌─────────────────────────────────────────┐
# │  startarch.sh — Arch Linux ARM proot    │
# │  github.com/DeadKnox/Termux-Desktops      │
# └─────────────────────────────────────────┘
# Mali / MediaTek / Exynos — VirGL
# Usage: bash ~/startarch.sh

killall -9 termux-x11 pulseaudio virgl_test_server_android 2>/dev/null
rm -f /tmp/.X0-lock /tmp/.X11-unix/X0
sleep 1

pulseaudio --start \
  --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
  --exit-idle-time=-1

virgl_test_server_android &
sleep 1

termux-x11 :1 &
sleep 2

am start --user 0 -n com.termux.x11/.MainActivity

export XDG_RUNTIME_DIR=${TMPDIR}

proot-distro login archlinux --shared-tmp -- /bin/bash -c \
  'export PULSE_SERVER=127.0.0.1 && export XDG_RUNTIME_DIR=/tmp && su - YourUsername -c "env DISPLAY=:1 GALLIUM_DRIVER=virpipe MESA_GL_VERSION_OVERRIDE=4.0 dbus-launch --exit-with-session xfce4-session"'
