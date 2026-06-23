# Add Starship (pretty prompt)
# See: https://starship.rs/
eval "$(starship init zsh)"

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

# fzf key bindings and fuzzy completion. Enables CTRL-R (fuzzy history
# search), CTRL-T (insert files/dirs), and ALT-C (cd into a directory).
# See: https://github.com/junegunn/fzf
source <(fzf --zsh)

# zoxide (smarter `cd`). Must be initialised *last* so its `chpwd` hook
# isn't displaced by anything sourced afterwards (otherwise its built-in
# `doctor` check fires on directory change).
# See: https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh --cmd cd)"
