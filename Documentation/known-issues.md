# ⚠️ Known Issues & Fixes

> Common problems you might run into with proot desktops on Android — and how to fix them.

---

## 1. `sudo` doesn't work in proot

**Error:**
```
sudo: The "no new privileges" flag is set, which prevents sudo from running as root.
```

**Why it happens:**  
Android's kernel sets a `no_new_privs` flag on all processes. This prevents privilege escalation — which is exactly what `sudo` tries to do. It's an OS-level restriction, not a bug in the distro.

**Fix — use `su -` instead:**  
From any desktop terminal:

```bash
su -
# enter root password
apt install whatever-you-need
exit
```

> ⚠️ Make sure you set a root password during setup with `passwd` while logged in as root.

---

## 2. `X server already running on display :0`

**Error:**
```
/usr/bin/startxfce4: X server already running on display :0
xfce4-session: Cannot open display: .
```

**Why it happens:**  
Another process (usually a previous desktop session) is already using display `:0`.

**Fix:**  
Our launch scripts use `:1` to avoid this. If you still see it:

```bash
pkill -f termux-x11
pkill -f pulseaudio
pkill -f virgl_test_server
sleep 2
bash ~/startYOURDISTRO.sh
```

---

## 3. `llvmpipe` instead of virgl (no GPU acceleration)

**Symptom:**  
```bash
glxinfo | grep "OpenGL renderer"
# Shows: llvmpipe (LLVM ...) instead of virgl
```

Desktop feels laggy and slow.

**Why it happens:**  
`virgl_test_server_android` wasn't running before the desktop launched.

**Fix:**  
Our launch scripts start it automatically. If you modified your script, make sure this line runs **before** `termux-x11`:

```bash
virgl_test_server_android &
sleep 1
```

---

## 4. `dpkg returned error code` on Kali Linux

**Error:**
```
dpkg: error processing package systemd-standalone-sysusers
```

**Why it happens:**  
Kali's packages depend on `systemd` components that don't exist in proot.

**Fix — stub the broken postinst scripts:**

```bash
for pkg in systemd-standalone-sysusers udev dbus-system-bus-common polkitd; do
  script="/var/lib/dpkg/info/${pkg}.postinst"
  if [ -f "$script" ]; then
    echo '#!/bin/sh' > "$script"
    echo 'exit 0' >> "$script"
  fi
done
dpkg --configure --force-all -a
```

---

## 5. Black screen after launching

**Why it happens:**  
Termux:X11 app wasn't open, or the desktop took too long to start.

**Fix:**
- Make sure the **Termux:X11 app** is installed and open on your device
- Kill everything and relaunch:

```bash
pkill -f termux-x11
pkill -f pulseaudio
pkill -f virgl_test_server
sleep 2
bash ~/startYOURDISTRO.sh
```

---

## 6. Audio not working

**Why it happens:**  
PulseAudio server didn't start or connect properly.

**Fix:**  
Kill and restart PulseAudio:

```bash
pkill -f pulseaudio
pulseaudio --start \
  --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
  --exit-idle-time=-1
```

Make sure `PULSE_SERVER=127.0.0.1` is exported inside your proot session.

---

## 7. Termux:X11 shows wrong resolution

**Fix:**  
Open the Termux:X11 app → tap the settings icon and set:

| Setting | Value |
|---|---|
| Display resolution mode | `exact` |
| Exact width | your screen width (e.g. `1280`) |
| Exact height | your screen height (e.g. `720`) |
| Fullscreen on device display | On |

---

## 8. `proot-distro: command not found`

**Fix:**

```bash
pkg install proot-distro
```

---

<div align="right"><a href="../README.md">← back to index</a></div>
