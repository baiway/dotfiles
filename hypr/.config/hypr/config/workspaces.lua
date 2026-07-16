-- Workspace rules wiki https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- Add your workspace rules here. Increment the workspace number as you go. Do not have duplicate workspaces.
hl.workspace_rule({ workspace = "1", monitor = MONITOR1, default = true, persistent = true })
hl.workspace_rule({ workspace = "2", monitor = MONITOR1, persistent = true })
hl.workspace_rule({ workspace = "3", monitor = MONITOR1, persistent = true })
-- Gaming: a normal numbered workspace so it sorts into place in the bar and
-- answers to SUPER + <n>. default_name only labels it; windowrules.lua targets
-- it by number. Not persistent, so its pill only appears while a game runs.
hl.workspace_rule({ workspace = tostring(GAMING_WORKSPACE), monitor = PRIMARY_MONITOR, default_name = "gaming" })
