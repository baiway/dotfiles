# Setting up M5 MacBook Air
## 1. Install Homebrew
This is the only bootstrap step that can't go in the Brewfile.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow any post-install instructions Homebrew prints (typically adding `eval "$(/opt/homebrew/bin/brew shellenv)"` to your shell profile so `brew` is on PATH).

## 2. Install everything else via Brewfile
Save the following as `./Brewfile`:
```ruby
# Brewfile

# CLI tools
brew "ghostty"  # Terminal emulator. See: https://ghostty.org/
brew "helix"    # Editor. See: https://helix-editor.com/
brew "starship" # Prettier prompt. See: https://starship.rs/
brew "eza"      # Prettier `ls`. See: https://eza.rocks/
brew "ripgrep"  # Faster `grep`. See: https://github.com/burntsushi/ripgrep
brew "fd"       # Faster `find`. See: https://github.com/sharkdp/fd
brew "fzf"      # Fuzzy finder. See: https://github.com/junegunn/fzf
brew "zoxide"   # Smarter `cd`. See: https://github.com/ajeetdsouza/zoxide
brew "bat"      # Prettier `cat`. See: https://github.com/sharkdp/bat
brew "tldr"     # More readable `man` pages. https://github.com/tldr-pages/tldr
brew "tree"     # Useful for copy-pasting plaintext directory structures
brew "gh"       # GitHub CLI. See: https://cli.github.com/
brew "git"      # Newer version than that shipped with macOS
brew "rsync"    # File transfers. See: https://linux.die.net/man/1/rsync
brew "ffmpeg"   # Does all things video. See: https://ffmpeg.org/
cask "claude-code" # LLM CLI app. See: https://code.claude.com/docs

# Zsh plugins
brew "zsh-syntax-highlighting"
brew "zsh-autosuggestions"

# Compilers and build tooling
brew "gcc"    # Needed for `gfortran`
brew "make"   # macOS uses GNU Make 3.81 (from 2006)
brew "cmake"

# Scientific libraries
brew "netcdf"
brew "netcdf-fortran"
brew "fftw"
brew "open-mpi"
brew "openblas"

# Python tooling
brew "uv"       # Dependency management. See: https://docs.astral.sh/uv/
brew "ruff"     # Linter. See: https://docs.astral.sh/ruff/
brew "ty"       # LSP and type-checker. See: https://docs.astral.sh/ty/

# Fortran tooling
brew "fortitude" # Linter. See: https://fortitude.readthedocs.io/
brew "fortls"    # LSP. See: https://fortls.fortran-lang.org/

# General utilities
cask "scroll-reverser"     # See: https://pilotmoon.com/scrollreverser/
cask "sensiblesidebuttons" # See: https://sensible-side-buttons.archagon.net/
cask "rectangle"           # Window management. See: https://rectangleapp.com/
cask "stats"               # System monitor. See: https://mac-stats.com/

# Writing and LaTeX tooling
cask "zotero"   # Reference management. See: https://www.zotero.org/
brew "tectonic" # Modern TeX engine. See: https://tectonic-typesetting.github.io/
brew "pandoc"   # Document conversion. See: https://pandoc.org/

# GUI apps
cask "zen"         # Web browser. See: https://zen-browser.app/
cask "obsidian"    # Markdown notes. See: https://obsidian.md/
cask "zoom"        # Video conferencing. See: https://www.zoom.com/
cask "claude"      # LLM GUI app. See: https://claude.com
cask "whatsapp"    # Messaging service. See: https://whatsapp.com/
cask "proton-pass" # Password manager. See: https://proton.me/pass
cask "protonvpn"   # VPN. See: https://protonvpn.com/
cask "proton-mail-bridge" # Use Mail app with Proton https://proton.me/mail/bridge
```

Then run:
```sh
brew bundle --file=./Brewfile
```

## 3. Install Python via `uv`

```sh
uv python install 3.14 --default
```

The `--default` flag is currently experimental but installs `python` and `python3` shims (not just `python3.14`) into `~/.local/bin`. Versioned shims are stable and install automatically.

## 4. Copy over `.zshrc`
Save the following as `~/.zshrc`:
```sh
# Add Starship (pretty prompt)
# See: https://starship.rs/
eval "$(starship init zsh)"

# Add zoxide (smarter `cd`). Defers to standard `cd` semantics for real paths.
# See: https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh --cmd cd)"

# Add Fish-style syntax highlighting to Zsh
# See: https://github.com/zsh-users/zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add Fish-style autosuggestions to Zsh
# See: https://github.com/zsh-users/zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Add Git autocomplete to Zsh
# Line from link below but with added `-C` flag which skips daily `.zcompdump`
# security check for faster shell startup.
# https://stackoverflow.com/questions/24513873/git-tab-completion-not-working-in-zsh-on-mac
autoload -Uz compinit && compinit -C

# Alias `ls` and `tree` to use `eza` (prettier and easier to read)
# See: https://github.com/eza-community/eza
alias ls="eza --icons --grid --classify --colour=auto --sort=type --group-directories-first --header --modified --created --git --binary --group"
alias tree="eza --tree --colour=auto"

# Alias `ssh` to get colours over SSH connections
alias ssh="TERM=xterm-256color ssh"
```

> [!WARNING] FIXME
> Steps 3 and 4 (and the Starship `eval` line being inside `.zshrc` rather than a stowed config fragment) can be tidied up once `.dotfiles` are managed via GNU Stow.

## 5. Manual installations
- [ ] [Proton Pass Firefox extension](https://addons.mozilla.org/en-US/firefox/addon/proton-pass/)
- [ ] [GlobalProtect](https://vpn.york.ac.uk)
## 6. macOS configuration
- [ ] Set Zen as the default browser via **System Settings → Desktop & Dock → Default web browser**
- [ ] Open SensibleSideButtons, Rectangle and Scroll Reverser for the first time and grant them Accessibility permissions
- [ ] Add SensibleSideButtons, Rectangle, Scroll Reverser and Stats to Login items
- [ ] Sanity-check default Settings
	- **See:** [Mac Settings That ACTUALLY Make A Difference](https://www.youtube.com/watch?v=Kft9Y33oc2I)
## 7. Authentication
### SSH
- [ ] Copy over `~/.ssh/config` file
- [ ] Set up SSH keys for the following and **revoke old keys**. Store keys like e.g. `~/.ssh/keys/github/id_ed25519`
	- [ ] GitHub (Settings -> SSH -> GPG keys)
	- [ ] BitBucket (Personal settings -> SSH keys)
	- [ ] ARCHER2 SAFE
### Accounts
- [ ] Sign in to internet accounts for Mail and Calendar
	- [ ] Personal
	- [ ] PhD / work
	- [ ] Tutoring
- [ ] Configure Zen Spaces (Personal, PhD/Work, Tutoring), pinned tabs and Essentials; sign in to associated accounts in each space
- [ ] Sign in to Obsidian Sync
- [ ] Sign in to Zoom
- [ ] Sign in to WhatsApp
- [ ] Sign in to Claude and Claude Code
- [ ] Sign in to Zotero (cloud sync)
## 8. Configuration
- [ ] Copy over `~/.config/helix/`
- [ ] Copy over `~/.gitconfig`
- [ ] Restore Obsidian vault using Obsidian Sync