-- Initialize an empty table to export if needed later
local submaps = {}

local MENU_MAIN = "󰍜 MAIN: [l]ayout, [w]indow, [s]ystem"
local MENU_LAYOUT = "󰙀 LAYOUT: [m]aster, [d]windle, [s]croll, m[o]nocle"
local MENU_WINDOW = " WINDOW: [r]esize"
local MENU_RESIZE = " RESIZE: [Arrows] 10px, [Shift] 50px, [Ctrl] 1px"
local MENU_SYSTEM = " SYSTEM: [q]uit, Kanata [k]:resume [K]:pause, Power: suspend-[T]hen-hibernate, suspen[D], [H]ibernate, [R]eboot, power-of[F]"

-- trigger modal shortcuts
hl.bind(myEnv.mainMod .. " + M", hl.dsp.submap(MENU_MAIN))

hl.define_submap(MENU_MAIN, function()
  hl.bind("L", hl.dsp.submap(MENU_LAYOUT))
  hl.bind("W", hl.dsp.submap(MENU_WINDOW))
  hl.bind("S", hl.dsp.submap(MENU_SYSTEM))

  hl.bind("escape", hl.dsp.submap("reset"))
  hl.bind("catchall", hl.dsp.submap("reset"))
end)

hl.define_submap(MENU_LAYOUT, "reset", function()
  hl.bind("M", function() hl.config({ general = { layout = "master" } }) end)
  hl.bind("D", function() hl.config({ general = { layout = "dwindle" } }) end)
  hl.bind("S", function() hl.config({ general = { layout = "scrolling" } }) end)
  hl.bind("O", function() hl.config({ general = { layout = "monocle" } }) end)
  hl.bind("escape", hl.dsp.submap("reset"))
  hl.bind("catchall", hl.dsp.submap("reset"))
end)

hl.define_submap(MENU_WINDOW, function()
    hl.bind("R", hl.dsp.submap(MENU_RESIZE))

    hl.define_submap(MENU_RESIZE, function()
        -- Repeatable arrow movement binds
        hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
        hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
        hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })
        hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })
        -- bigger shift
        hl.bind("SHIFT + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true}), { repeating = true })
        hl.bind("SHIFT + left", hl.dsp.window.resize({ x = -50, y = 0, relative = true}), { repeating = true })
        hl.bind("SHIFT + up", hl.dsp.window.resize({ x = 0, y = 50, relative = true}), { repeating = true })
        hl.bind("SHIFT + down", hl.dsp.window.resize({ x = 0, y = -50, relative = true}), { repeating = true })
        -- finer control
        hl.bind("CTRL + right", hl.dsp.window.resize({ x = 1, y = 0, relative = true}), { repeating = true })
        hl.bind("CTRL + left", hl.dsp.window.resize({ x = -1, y = 0, relative = true}), { repeating = true })
        hl.bind("CTRL + up", hl.dsp.window.resize({ x = 0, y = 1, relative = true}), { repeating = true })
        hl.bind("CTRL + down", hl.dsp.window.resize({ x = 0, y = -1, relative = true}), { repeating = true })

        -- Escape maps back to the root namespace
        hl.bind("escape", hl.dsp.submap("reset"))
        -- we cannot use catchall, which would catch CTRL itself
        -- hl.bind("catchall", hl.dsp.submap("reset"))
    end)

    hl.bind("escape", hl.dsp.submap("reset"))
    hl.bind("catchall", hl.dsp.submap("reset"))
end)

hl.define_submap(MENU_SYSTEM, "reset", function()
    -- quit hyrpland
    hl.bind("Q", hl.dsp.exit())

    -- kanata pause/resume
    hl.bind(        "K", hl.dsp.exec_cmd("~/.config/kanata/local/kanata-toggle.sh resume"), { locked = false, repeating = false})
    hl.bind("SHIFT + K", hl.dsp.exec_cmd("~/.config/kanata/local/kanata-toggle.sh pause"), { locked = false, repeating = false})

    -- system power management
    hl.bind("SHIFT + T", hl.dsp.exec_cmd("/usr/bin/systemctl suspend-then-hibernate"))
    hl.bind("SHIFT + D", hl.dsp.exec_cmd("/usr/bin/systemctl suspend"))
    hl.bind("SHIFT + H", hl.dsp.exec_cmd("/usr/bin/systemctl hibernate"))
    hl.bind("SHIFT + R", hl.dsp.exec_cmd("/usr/bin/systemctl reboot"))
    hl.bind("SHIFT + F", hl.dsp.exec_cmd("/usr/bin/systemctl poweroff"))

    hl.bind("escape", hl.dsp.submap("reset"))
end)

return submaps
