-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "highres",
    position = "auto",
    scale    = "1",
})


-- global env vars
myEnv = {
  -- Set programs that you use
  terminal    = "kitty",
  --fileManager = "pcmanfm-qt",
  menu        = "rofi -show combi",

  -- keyboard shortcut
  mainMod = "SUPER + ALT",
  quickMod = "SUPER"
}



-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
  -- Environment Initialization
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  -- Core Desktops Daemons & Status bar
  hl.exec_cmd("waybar")
  hl.exec_cmd("/usr/bin/pypr")

  -- Background Assets & Display Tweaks
  hl.exec_cmd("~/.config/hypr/scripts/wallpapers.sh")
  hl.exec_cmd("nm-applet --indicator") -- Removed '&' as hl.exec_cmd is inherently async
  hl.exec_cmd("wl-gammarelay-rs")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("dunst") --
  hl.exec_cmd("systemctl --user start hyprpolkitagent")

  -- Input Method Framework (Fcitx5)
  hl.exec_cmd("fcitx5-remote -r")
  hl.exec_cmd("fcitx5-d --replace") -- Removed '&'
  hl.exec_cmd("fcitx5-remote -r")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

hl.config({
  ecosystem = {
    enforce_permissions = true,
  },
})

hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 1,
        gaps_out = 0,

        border_size = 1,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 0,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        dim_inactive     = true,
        dim_strength     = 0.08,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
        disable_splash_rendering = true,
        mouse_move_enables_dpms = true, -- If DPMS is set to off, wake up the monitors if the mouse moves.
        key_press_enables_dpms = true -- If DPMS is set to off, wake up the monitors if a key is pressed.
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
-- hl.device({
--     name        = "epic-mouse-v1",
--     sensitivity = -0.5,
-- })


---------------------
---- KEYBINDINGS ----
---------------------

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
-- local closeWindowBind = hl.bind(myEnv.mainMod .. " + C", hl.dsp.window.close())
-- -- closeWindowBind:set_enabled(false)


-- COMPOSITOR & SYSTEM OPERATIONS (myEnv.quickMod)
hl.bind(myEnv.quickMod .. " + N", hl.dsp.exec_cmd(myEnv.terminal))
hl.bind(myEnv.quickMod .. " + L", hl.dsp.exec_cmd("bash -c 'loginctl lock-session'"))
hl.bind(myEnv.quickMod .. " + R", hl.dsp.exec_cmd(myEnv.menu))

-- Main Mod Core Operations
hl.bind(myEnv.mainMod .. " + SHIFT + backspace", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
--hl.bind(myEnv.mainMod .. " + SHIFT + R", hl.dsp.forcerendererreload())

-- ACTIVE WINDOW MANIPULATION
hl.bind(myEnv.mainMod .. " + backspace", hl.dsp.window.close())
hl.bind(myEnv.mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(myEnv.mainMod .. " + return", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(myEnv.mainMod .. " + V", hl.dsp.layout("togglesplit"))  -- dwindle only

-- TABBED CONTAINER WINDOW GROUPS
hl.bind(myEnv.mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(myEnv.mainMod .. " + T", hl.dsp.group.lock({ action = "toggle" }))
hl.bind(myEnv.mainMod .. " + P", hl.dsp.group.prev())
hl.bind(myEnv.mainMod .. " + N", hl.dsp.group.next())
hl.bind(myEnv.mainMod .. " + SHIFT + P", hl.dsp.group.move_window({ direction = "b" }))
hl.bind(myEnv.mainMod .. " + SHIFT + N", hl.dsp.group.move_window({ direction = "f" }))
hl.bind(myEnv.mainMod .. " + U", hl.dsp.window.pseudo()) -- fixes a window's dimension in its own tile

-- DIRECTIONAL FOCUS WINDOW SELECTION
hl.bind(myEnv.mainMod .. " + J", hl.dsp.focus({ direction = "left" }))
hl.bind(myEnv.mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(myEnv.mainMod .. " + I", hl.dsp.focus({ direction = "up" }))
hl.bind(myEnv.mainMod .. " + K", hl.dsp.focus({ direction = "down" }))

-- WINDOW DIRECTIONAL DISPLACEMENT (Moving Windows/Groups)
hl.bind(myEnv.mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "l", group_aware = true }))
hl.bind(myEnv.mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r", group_aware = true }))
hl.bind(myEnv.mainMod .. " + SHIFT + I", hl.dsp.window.move({ direction = "u", group_aware = true }))
hl.bind(myEnv.mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "d", group_aware = true }))

-- DYNAMIC WORKSPACE MATRIX MAPPINGS
local workspace_map = {
    ["1"] = "1",  ["2"] = "2",  ["3"] = "3",  ["4"] = "14", ["5"] = "15",
    ["Q"] = "4",  ["W"] = "5",  ["E"] = "6",  ["A"] = "7",  ["S"] = "8",
    ["D"] = "9",  ["Z"] = "10", ["X"] = "11", ["C"] = "12"
}
for physical_key, target_workspace in pairs(workspace_map) do
    -- Switch focused workspace (Requires string parameters)
    hl.bind(myEnv.mainMod .. " + " .. physical_key, hl.dsp.focus({ workspace = target_workspace }))
    -- Send window silently to background workspace
    hl.bind(myEnv.mainMod .. " + SHIFT + " .. physical_key, hl.dsp.window.move({ workspace = target_workspace, follow = false }))
end

-- special workspace (scratchpad)
hl.bind(myEnv.mainMod .. " + O",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(myEnv.mainMod .. " + SHIFT + O", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with myEnv.mainMod + scroll
hl.bind(myEnv.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(myEnv.mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with myEnv.mainMod + LMB/RMB and dragging
hl.bind(myEnv.mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(myEnv.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- pyprland
hl.bind(myEnv.mainMod .. " + slash", hl.dsp.exec_cmd("pypr expose"))
hl.bind(myEnv.mainMod .. " + 0", hl.dsp.exec_cmd("pypr zoom"))
hl.bind(myEnv.mainMod .. " + equal", hl.dsp.exec_cmd("pypr zoom ++0.3"))
hl.bind(myEnv.mainMod .. " + minus", hl.dsp.exec_cmd("pypr zoom --0.3"))
hl.bind(myEnv.mainMod .. " + comma", hl.dsp.exec_cmd("pypr toggle keepassxc"))



-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("SHIFT + XF86AudioMute",hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 100%"),{ locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("SHIFT + XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 100%"), { locked = true, repeating = false })
hl.bind("SHIFT + XF86MonBrightnessDown",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%"), { locked = true, repeating = false })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- submap / waybar
require("hyprland-submaps")
-- trigger modal shortcuts
hl.bind(myEnv.mainMod .. " + M", hl.dsp.submap("main"))
-- toggle visibility of waybar
hl.bind(myEnv.mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("pkill -USR1 waybar"))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

