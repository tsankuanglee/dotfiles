-- actions and apps
local hint = [[
  ^ ^ Actions
  ^
  _._ replace . with space
  _$_ trim file's trailing \\s

  ^ ^ Apps
  _t_ terminal
  _a_ AerialToggle!
  _A_ AerialNavToggle
  _d_ DataViewer (for csv/sqlite, q to quit)

  _L_ Lazy
  _M_ Mason

      _<ESC>_  _<CR>_
]]

local setup = function()
  local Hydra = require("hydra")
  local cmd = require("hydra.keymap-util").cmd
  Hydra({
    name = "Actions",
    hint = hint,
    config = {
      color = "blue",
      invoke_on_body = true,
      hint = {
        position = "middle",
        float_opts = {},
      },
      exit = true,
    },
    mode = { "n", "x" },
    body = "<LEADER>a",
    heads = {
      { ".", cmd("'<,'>s/\\./ /g"), { exit = true, desc = "replace . with space" } },
      { "$", cmd("%s/\\s\\+$//g"), { exit = true, desc = "trim file's trailing \\s*" } },
      { "t", cmd("terminal"), { exit = true, desc = ":terminal" } },
      { "a", cmd("AerialToggle!"), { exit = true, desc = ":AerialToggle!" } },
      { "A", cmd("AerialNavToggle"), { exit = true, desc = ":AerialNavToggle" } },
      { "d", cmd("DataViewer"), { exit = true, desc = ":DataViewer" } },

      { "L", cmd("Lazy"), { exit = true, desc = ":Lazy" } },
      { "M", cmd("Mason"), { exit = true, desc = ":Mason" } },

      { "<ESC>", nil, { exit = true, desc = "close" } },
      { "<CR>", nil, { exit = true, desc = "close" } },
    },
  })
  -- code
end

return {
  setup = setup,
}
