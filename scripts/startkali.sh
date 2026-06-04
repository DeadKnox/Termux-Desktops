#!/data/data/com.termux/files/usr/bin/bash

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

GALLIUM_DRIVER=virpipe \
MESA_GL_VERSION_OVERRIDE=4.0 \
DISPLAY=:1 \
PULSE_SERVER=127.0.0.1 \
XDG_RUNTIME_DIR=/tmp \
proot-distro login kali-rolling --shared-tmp --user YourUsername -- \
bash -c "export DISPLAY=:1 GALLIUM_DRIVER=virpipe MESA_GL_VERSION_OVERRIDE=4.0; dbus-launch --exit-with-session xfce4-session"
