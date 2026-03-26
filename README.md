# asm-dev-container

VS Code Dev Container template for low-level development:

- A user-space example app
- A tiny x86 boot sector (NASM, raw 512-byte `.bin`)


This repo is set up to be opened in a Dev Container so everyone gets the same toolchain.

## What’s included

- Dev Container (Ubuntu 22.04) with: `g++`, `nasm`, `gdb`, `make`, `git`
- VS Code extensions:
	- C/C++ (`ms-vscode.cpptools`)
	- x86/x86-64 assembly highlighting (`13xforever.language-x86-64-assembly`)
- VS Code integration:
	- Build task: **Build All** (`make all`)
	- Debug config: **Debug User App** (GDB, Intel disassembly)

## Prerequisites

- VS Code
- Docker (Docker Desktop on Windows/macOS, Docker Engine on Linux)
- VS Code Dev Containers extension

## Quick start (recommended)

1. Open this folder in VS Code.
2. Use the command palette: **Dev Containers: Reopen in Container**.
3. Build:

	 ```bash
	 make all
	 ```

Or run the VS Code task **Build All**.

## Build

Build everything (user app + boot sector binaries):

```bash
make all
```

Clean build outputs:

```bash
make clean
```

## Debug the user app (VS Code)

Use **Run and Debug** → **Debug User App**.

- Automatically runs the **Build All** task before launching
- Uses `gdb`
- Sets Intel syntax for disassembly

## Boot sector

Build produces a raw boot sector binary at `build/boot.bin`.

Run it with QEMU:

```bash
qemu-system-x86_64 -s -drive format=raw,file="build/boot.bin"
```

## Project structure

- `app/` — C++ + ELF64 NASM (linked into `build/app.out`)
- `boot/` — raw boot sector NASM (assembled into `build/*.bin`)
- `build/` — build outputs
- `.devcontainer/` — Dev Container definition (toolchain + extensions)
- `.vscode/` — VS Code task and debug configuration

## License

See `LICENSE`.
