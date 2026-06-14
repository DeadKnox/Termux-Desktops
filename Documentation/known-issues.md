# ⚠️ Known Issues & Fixes

> Common problems you might run into — and exactly how to fix them.

---

## 1. `sudo` doesn't work in proot

**Error:**
```
sudo: The "no new privileges" flag is set, which prevents sudo from running as root.
```

**Why:** Android's kernel sets a `no_new_privs` flag on all processes blocking privilege escalation. This is an OS-level restriction — not a bug.

**Fix A — Use `su -` from the desktop terminal:**
```bash
su -
# enter root password
apt install whatever-you-need
exit
```

> Set a root password during setup: log in as root and run `passwd`

**Fix B — Make sure you used our updated launch scripts** which use `su - YourUsername` instead of `--user`. Download the latest scripts:
```bash
wget https://raw.githubusercontent.com/DeadKnox/Termux-Desktop/main/scripts/startdebian.sh -O ~/startdebian.sh
```

---

## 2. `cursor:arm64` blocks package installation

**Error:**
```
dpkg: error processing package cursor:arm64 (--remove):
 cannot remove '/usr': Read-only file system
```

**Why:** Cursor AI was installed as an external `.deb` with Debian-style paths. Its removal script tries to delete `/usr` which is read-only in Termux.

**Fix:**
```bash
# Stub the broken removal scripts
echo '#!/bin/bash' > /data/data/com.termux/files/usr/var/lib/dpkg/info/cursor.prerm
echo 'exit 0' >> /data/data/com.termux/files/usr/var/lib/dpkg/info/cursor.prerm
echo '#!/bin/bash' > /data/data/com.termux/files/usr/var/lib/dpkg/info/cursor.postrm
echo 'exit 0' >> /data/data/com.termux/files/usr/var/lib/dpkg/info/cursor.postrm

# Fix dpkg status
sed -i 's/Status: deinstall ok half-installed/Status: deinstall ok config-files/' \
  /data/data/com.termux/files/usr/var/lib/dpkg/status

# Remove cursor entry from dpkg database
sed -i '/^Package: cursor$/,/^$/d' \
  /data/data/com.termux/files/usr/var/lib/dpkg/status

dpkg --configure -a
```

Then retry your `pkg install` command.

---

## 3. `X server already running on display :0`

**Error:**
```
/usr/bin/startxfce4: X server already running on display :0
xfce4-session: Cannot open display: .
```

**Why:** Another session is already using display `:0`, or a previous session didn't close cleanly.

**Fix:**
```bash
pkill -f termux-x11
pkill -f pulseaudio
pkill -f virgl_test_server
sleep 2
bash ~/startYOURDISTRO.sh
```

Our scripts use `:1` by default to avoid this conflict.

---

## 4. `llvmpipe` instead of virgl (no GPU acceleration)

**Symptom:**
```bash
glxinfo | grep "OpenGL renderer"
# Shows: llvmpipe instead of virgl
```

**Why:** `virgl_test_server_android` wasn't running before the desktop launched.

**Fix:** Our scripts start it automatically. If you modified your script, make sure this runs **before** `termux-x11`:
```bash
virgl_test_server_android &
sleep 1
```

> **Mali users on Native Termux:** llvmpipe is expected — VirGL only works in proot. Use a proot distro for hardware acceleration.

---

## 5. `dpkg returned error code` on Kali Linux

**Error:**
```
dpkg: error processing package systemd-standalone-sysusers
```

**Why:** Kali's packages depend on `systemd` which doesn't exist in proot.

**Fix:**
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

## 6. Black screen after launching

**Fix:**
- Make sure **Termux:X11 app** is installed and open
- Kill everything and relaunch:
```bash
pkill -f termux-x11
pkill -f pulseaudio
pkill -f virgl_test_server
sleep 2
bash ~/startYOURDISTRO.sh
```

---

## 7. Audio not working

**Fix:**
```bash
pkill -f pulseaudio
pulseaudio --start \
  --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
  --exit-idle-time=-1
```

---

## 8. Wrong resolution in Termux:X11

Open Termux:X11 app → settings:

| Setting | Value |
|---|---|
| Display resolution mode | `exact` |
| Exact width | your screen width |
| Exact height | your screen height |
| Fullscreen on device display | On |

---

## 9. `proot-distro: command not found`

```bash
pkg install proot-distro
```

---

<div align="right"><a href="../README.md">← back to index</a></div>
