# 🤝 Contributing to Termux-Desktops

Thanks for wanting to help make this better!

---

## Adding a New Distro Guide

1. Fork the repo
2. Create `distros/YOURDISTRO/README.md` — follow the structure of [Debian](distros/debian/README.md)
3. Add real screenshots to `distros/YOURDISTRO/screenshots/`
4. Add your launch scripts to `scripts/`:
   - `startDISTRO.sh` → Mali/VirGL
   - `startDISTRO-adreno.sh` → Adreno/Zink+Turnip
5. Update the table in `README.md`
6. Open a Pull Request with a clear description

---

## Guide Structure

Every distro guide should include:

- ✅ Install command
- ✅ Create non-root user + set root password
- ✅ Install XFCE4 + apps
- ✅ VirGL or Adreno GPU setup
- ✅ wget download for launch script (Mali + Adreno options)
- ✅ `su -` note for installing packages from desktop
- ✅ Troubleshooting section
- ✅ glmark2 benchmark score
- ✅ At least 1 screenshot showing fastfetch

---

## Script Guidelines

- Always use `su - YourUsername` not `--user` flag
- Always use display `:1`
- Start `virgl_test_server_android` before `termux-x11`
- Include the repo URL in the script header comment
- Use `YourUsername` as placeholder, never hardcode a name

---

## Reporting Issues

Open a GitHub Issue with:
- Your device + chipset + GPU
- Android version
- Exact error message
- Steps to reproduce

---

<div align="right">

*Made by [Knox](https://github.com/DeadKnox)*

</div>
