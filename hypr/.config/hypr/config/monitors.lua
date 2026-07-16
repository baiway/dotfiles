-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Example: output can be found with hyprctl monitors. Edit variables.lua for the monitor outputs instead of here directly
-- hl.monitor({
--     output    = "MONITOR1",
--     mode      = "1920x1080@60",
--     position  = "0x0",
--     scale     = "1",
-- })

hl.monitor({
    output    = MONITOR1,
    mode      = "3840x2160@60",
    position  = "0x0",
    -- 3840 / 1.5 = 2560 exactly; non-integer buffer sizes make Hyprland
    -- reject the scale and fall back to 1.
    scale     = "1.5"
})
