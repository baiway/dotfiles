-- Hyprland default apps

TERMINAL     = "ghostty"
-- Window class of TERMINAL, for window rules. This is NOT the command above --
-- Ghostty's binary is "ghostty" but it reports class "com.mitchellh.ghostty".
-- Find yours with: hyprctl clients -j | grep class
TERMINAL_CLASS = "com\\.mitchellh\\.ghostty"
FILE_MANAGER = "dolphin"
BROWSER      = "zen-browser"
EDITOR       = "hx"
CALCULATOR   = "gnome-calculator"

-- Monitors
MONITOR1 = "HDMI-A-1" -- Dell U2720Q 27" 4K
MONITOR2 = ""
MONITOR3 = ""
PRIMARY_MONITOR = MONITOR1

-- Workspaces
NUM_WPM = 3 -- Number of workspaces per monitor (Max 10)
