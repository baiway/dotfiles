# dotfiles

Personal macOS configuration managed with [GNU Stow](https://www.gnu.org/software/stow/) and a Brewfile.

## Bootstrap a fresh Mac

```sh
git clone https://github.com/baiway/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./bootstrap
```

The script is idempotent — re-running is safe. It will:

1. Install Xcode Command Line Tools (if missing; requires a GUI prompt, then re-run).
2. Install Homebrew (if missing).
3. Run `brew bundle` against [`Brewfile`](Brewfile) to install everything, including `stow` itself.
4. `stow` each package into `$HOME`, creating symlinks like `~/.zshrc → ~/.dotfiles/zsh/.zshrc`.
5. Install Python 3.14 via `uv`.

Then follow [`SETUP.md`](SETUP.md) for the remaining manual steps (account sign-ins, SSH key generation, macOS GUI permissions).

## Layout

Each top-level directory is a Stow package whose internal tree mirrors `$HOME`:

```
git/.gitconfig
zsh/.zshrc
ssh/.ssh/config
helix/.config/helix/{config.toml,languages.toml}
ghostty/.config/ghostty/config
hypr/.config/hypr/{hyprland.lua,xdph.conf,config/*.lua}
```

Packages are stowed per-platform: `bootstrap-macos` and `bootstrap-cachyos` each carry
their own `PACKAGES` list, so Linux-only packages like `hypr` stay off macOS.

### Adding a new config to the repo

To move an existing config (say `~/.config/shelly/config.json`) under version control:

```sh
cd ~/.dotfiles                                    # Always run stow from here
mkdir -p shelly/.config/shelly                    # Mirror the path it has in $HOME
mv ~/.config/shelly/config.json shelly/.config/shelly/
stow --target="$HOME" shelly                      # Symlinks it back into place
```

The package's internal tree must mirror where the file lives under `$HOME`: a file
at `~/.config/shelly/config.json` lives at `shelly/.config/shelly/config.json` in the
repo. After stowing, `~/.config/shelly/config.json` is a symlink into the repo, so
`git status` shows the new `shelly/` package. Add it to the relevant bootstrap's
`PACKAGES` list (`bootstrap-cachyos` and/or `bootstrap-macos`) so a fresh install
stows it too.

## Conflict handling

On the first run, `stow` aborts if a real file already exists at a target path (e.g. a default `~/.zshrc` that Homebrew dropped). Either delete the existing file and re-run, or use `stow --adopt <package>` to absorb it into the repo — then inspect the diff to decide whether to keep the absorbed version.

## What's deliberately not tracked

- `~/.config/gh/` — contains a GitHub OAuth token. Run `gh auth login` after bootstrap.
- `~/.ssh/keys/`, `id_*`, `*.pub`, `known_hosts` — gitignored. Generate keys as part of SETUP.md.
