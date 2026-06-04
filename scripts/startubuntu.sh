#!/bin/bash
# startubuntu.sh — launch Ubuntu 26.04 proot desktop
# Save this in Termux home: ~/startubuntu.sh
# Usage: bash ~/startubuntu.sh

# Kill old sessions
pkill -f termux-x11 2>/dev/null
pkill -f pulseaudio 2>/dev/null
pkill -f virgl 2>/dev/null
sleep 1

# Start Termux:X11 display server
termux-x11 :0 &
sleep 2

# Start audio server
pulseaudio --start \
  --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
  --exit-idle-time=-1

# Start VirGL GPU acceleration server
virgl_test_server_android &
sleep 1

# Launch Ubuntu proot as user ryuzaki with VirGL + XFCE4
proot-distro login ubuntu --user ryuzaki -- bash -c "
  export DISPLAY=:0
  export PULSE_SERVER=127.0.0.1
  export XDG_RUNTIME_DIR=/tmp
  export GALLIUM_DRIVER=virpipe
  export MESA_GL_VERSION_OVERRIDE=4.0
  dbus-launch --exit-with-session startxfce4
" &

# Open Termux:X11 app
sleep 3
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity
