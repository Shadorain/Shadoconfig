# Shadoconfig

Cross-platform dotfiles managed with **GNU Stow**, designed for macOS and Linux with minimal duplication and clean per-machine control.

---

## ✨ Overview

This repo is structured around three core ideas:

* **Packages** → individual configs (zsh, kitty, etc.)
* **Profiles** → define what gets installed per machine
* **Overlays** → machine-specific overrides

---

## 📦 Packages

Located in `packages/`, each package maps directly into `$HOME` via Stow.

Example:

```
packages/zsh/.config/zsh/.zshrc → ~/.config/zsh/.zshrc
```

**Guidelines:**

* One tool per package
* Keep packages reusable across machines

---

## 🧾 Profiles

Profiles (in `profiles/`) are simple lists of packages.

Example:

```
# profiles/mac
zsh
starship
kitty
```

```
# profiles/desktop
zsh
starship
kitty
hypr
cava
scripts
```

**Purpose:**

* macOS avoids Linux-only configs
* Desktop gets full setup

---

## 🧩 Overlays

Overlays (`overlays/<profile>/`) override or extend packages.

Example:

```
overlays/mac/.config/zsh/.zshrc
```

**Behavior:**

* Applied after packages
* Overrides matching files

**Use for:**

* OS-specific tweaks
* Machine-specific configs

---

## ⚙️ Scripts

Located in `scripts/`:

### Apply config

```
./scripts/apply [profile]
```

* Auto-detects profile if not provided
* Clears old symlinks
* Applies packages + overlays

### Remove configs

```
./scripts/unstow
```

### Detect profile

```
./scripts/detect-profile
```

---

## 🚀 Usage

### Setup

```
git clone https://github.com/Shadorain/Shadoconfig ~/.dotfiles
cd ~/.dotfiles
./scripts/apply
```

### Apply specific profile

```
./scripts/apply mac
./scripts/apply desktop
```

---

## 📁 Structure

```
packages/   # stow packages
profiles/   # package lists per machine
overlays/   # per-machine overrides
scripts/    # helper scripts
```

---

## 💡 Philosophy

* **Explicit > implicit** → profiles control everything
* **No duplication** → share via packages
* **Small units** → easier to maintain
* **Override sparingly** → use overlays only when needed

---

## 🛠 Tips

Dry run:

```
stow -n -v <package>
```

Adopt existing files:

```
stow --adopt <package>
```

---

## 🏁 Summary

* Packages = *what*
* Profiles = *where*
* Overlays = *differences*

---
