-- Animations were previously just `enabled = true` with no explicit speeds,
-- so Hyprland fell back to its own (fairly gentle) internal defaults.
-- Speed unit is deciseconds (speed = 1 -> 100ms); lower = faster.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

hl.config({
    animations = {
        enabled = true,
    },
})

hl.animation({ leaf = "global",        enabled = true, speed = 4,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 3,   bezier = "default" })
hl.animation({ leaf = "windows",       enabled = true, speed = 3,   bezier = "default" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 2.5, bezier = "default", style = "popin 90%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.8, bezier = "default", style = "popin 90%" })
hl.animation({ leaf = "windowsMove",   enabled = true, speed = 3,   bezier = "default" })
hl.animation({ leaf = "fade",          enabled = true, speed = 2,   bezier = "default" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.5, bezier = "default" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.2, bezier = "default" })
hl.animation({ leaf = "layers",        enabled = true, speed = 2.5, bezier = "default" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 2.5, bezier = "default", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5, bezier = "default", style = "fade" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 2,   bezier = "default" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.5, bezier = "default" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.5, bezier = "default" })
