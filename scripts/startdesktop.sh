#!/data/data/com.termux/files/usr/bin/bash
# startdesktop.sh — launch Termux Native XFCE4 desktop
# Usage: bash ~/startdesktop.sh

# Kill old sessions
kill -9 $(pgrep -f "termux.x11") 2>/dev/null
pkill -f pulseaudio 2>/dev/null
sleep 1

# Start PulseAudio
pulseaudio --start \
  --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
  --exit-idle-time=-1

# Set runtime dir and start Termux:X11
export XDG_RUNTIME_DIR=${TMPDIR}
termux-x11 :0 >/dev/null &
sleep 3

# Open Termux:X11 app
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity >/dev/null 2>&1
sleep 1

# Launch XFCE4
export PULSE_SERVER=127.0.0.1
env DISPLAY=:0 dbus-launch --exit-with-session xfce4-session >/dev/null 2>&1

exit 0
