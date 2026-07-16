-- Hyprland default apps

TERMINAL     = "ghostty"
-- Window class of TERMINAL, for window rules. This is NOT the command above --
-- Ghostty's binary is "ghostty" but it reports class "com.mitchellh.ghostty".
-- Find yours with: hyprctl clients -j | grep class
TERMINAL_CLASS = "com\\.mitchellh\\.ghostty"
FILE_MANAGER = "dolphin"
BROWSER      = "zen-browser"
-- hx is a TUI, so it needs a terminal to live in; a GUI editor would just be
-- its own bare command here.
EDITOR       = TERMINAL .. " -e hx"
CALCULATOR   = "gnome-calculator"

-- Monitors
MONITOR1 = "HDMI-A-1" -- Dell U2720Q 27" 4K
PRIMARY_MONITOR = MONITOR1

-- Workspaces
NUM_WPM = 4 -- Number of workspaces per monitor (Max 10)

-- The gaming workspace, referenced by windowrules.lua and workspaces.lua.
-- Must be a plain number: "name:gaming" makes Hyprland assign a named-workspace
-- ID (-1337), which sorts last in the bar and can't be reached by SUPER + <n>.
GAMING_WORKSPACE = 4
