# ⚡ Hardware Acceleration with VirGL

> Use your Android GPU inside proot Linux — no root required.

---

## GPU Acceleration Methods

| Environment | Method | Works? |
|---|---|:---:|
| proot (any distro) + VirGL | `virgl_test_server_android` bridge | ✅ Yes |
| Native Termux + VirGL | Not supported (no container layer) | ❌ No |
| Native Termux + Zink/Turnip | Vulkan-based Mesa (Adreno GPUs) | ✅ Yes |
| Native Termux + PanVK/Panfrost | Mesa Vulkan (some Mali devices) | ⚠️ Varies |
| Native Termux + llvmpipe | Software rendering fallback | ⚠️ Fallback only |

> **Note:** VirGL works by bridging Mesa inside the proot container to Android's GPU stack via `virgl_test_server_android`. Native Termux skips the container entirely, so VirGL doesn't apply — but modern devices can still get hardware acceleration through Vulkan-based Mesa drivers (Zink+Turnip for Adreno, Panfrost for some Mali).

---

VirGL (Virtual GL) is a technology that allows a guest Linux environment (your proot distro) to use the host Android GPU via a virtual 3D renderer. This gives you real OpenGL support inside your desktop, which means:

- Smooth XFCE4 desktop compositing
- Faster window rendering
- GPU-accelerated apps (glmark2, some games, etc.)

---

## Supported GPUs

| GPU | Works? |
|---|:---:|
| Mali-G77 MC9 (OnePlus Nord 2) | ✅ |
| Mali-G57 | ✅ |
| Adreno 6xx series | ✅ |
| Adreno 7xx series | ✅ (may vary) |

> Tested personally on **Mali-G77 MC9** — glmark2 scores: Debian 62, Ubuntu 56, Kali 63.

---

## Setup

### 1. Install the virgl server in Termux

```bash
pkg install virglrenderer-android
```

### 2. Start the server before launching your desktop

```bash
virgl_test_server_android &
```

This runs in the background and bridges your GPU to the proot environment.

### 3. Set environment variables inside your proot

These go in your launch script (already included in scripts in this repo):

```bash
export GALLIUM_DRIVER=virpipe
export MESA_GL_VERSION_OVERRIDE=4.0
```

---

## Verify It's Working

Inside your proot distro, run:

```bash
glmark2
```

Or check with:

```bash
glxinfo | grep "OpenGL renderer"
```

You should see something like:
```
OpenGL renderer string: virgl (Mali-G77)
```

Or via `fastfetch` — look for **Mesa virgl** in the GPU line.

---

## Benchmark Scores (ryuZaki's device)

```
Device : OnePlus Nord 2 5G
GPU    : Mali-G77 MC9

Debian  Trixie   → glmark2: 62
Ubuntu  26.04    → glmark2: 56
Kali    rolling  → glmark2: 63
```

---

<div align="right"><a href="../README.md">← back to index</a></div>
