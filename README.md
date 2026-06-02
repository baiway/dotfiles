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
```

To add a new tracked config, drop it in a package directory at the path it should occupy in `$HOME`, then re-run `./bootstrap` (or `stow --target="$HOME" --restow <package>`).

## Conflict handling

On the first run, `stow` aborts if a real file already exists at a target path (e.g. a default `~/.zshrc` that Homebrew dropped). Either delete the existing file and re-run, or use `stow --adopt <package>` to absorb it into the repo — then inspect the diff to decide whether to keep the absorbed version.

## What's deliberately not tracked

- `~/.config/gh/` — contains a GitHub OAuth token. Run `gh auth login` after bootstrap.
- `~/.ssh/keys/`, `id_*`, `*.pub`, `known_hosts` — gitignored. Generate keys as part of SETUP.md.
