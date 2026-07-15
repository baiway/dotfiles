# Keep CachyOS's shipped defaults
if test -f /usr/share/cachyos-fish-config/cachyos-config.fish
    source /usr/share/cachyos-fish-config/cachyos-config.fish
end

# --- my additions ------------------------------------------------------------
zoxide init --cmd cd fish | source
starship init fish | source
