# Contributing to Termux-Desktops

Thanks for wanting to help! Here's how to contribute.

---

## Adding a new distro guide

1. Fork the repo
2. Create `distros/YOURDISTRO/README.md` — follow the structure of existing guides like [Debian](distros/debian/README.md)
3. Add screenshots to `distros/YOURDISTRO/screenshots/`
4. Add your launch script to `scripts/startYOURDISTRO.sh`
5. Update the table in the main `README.md`
6. Open a Pull Request with a clear description

## Guide structure

Every distro guide should cover:
- Install command
- Create non-root user + set root password
- Install XFCE4
- VirGL or Adreno GPU setup
- Launch script (wget from repo)
- `su -` note for installing packages
- Troubleshooting section
- glmark2 benchmark (if available)

## Scripts

- Default (Mali/VirGL): `startDISTRO.sh`
- Adreno (Zink+Turnip): `startDISTRO-adreno.sh`
- Always use `su - YourUsername` not `--user` flag
- Always use display `:1`
- Start `virgl_test_server_android` before `termux-x11`

## Reporting issues

Open a GitHub Issue with:
- Your device + chipset + GPU
- Android version
- The exact error message
- Steps to reproduce

---

*Made by [_ryuZaki](https://github.com/ryuV2)*
