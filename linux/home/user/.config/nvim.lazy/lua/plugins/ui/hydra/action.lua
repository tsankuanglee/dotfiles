local hint = [[
  ^ ^ Actions
  ^
  _._ replace . with space
  _$_ trim file's trailing \\s
  _t_ terminal
  _d_ DataViewer (for csv/sqlite, q to quit)

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
        border = "rounded",
        position = "middle",
      },
      exit = true,
    },
    mode = { "n", "x" },
    body = "<LEADER>a",
    heads = {
      { ".", cmd("'<,'>s/\\./ /g"), { exit = true, desc = "replace . with space" }, },
      { "$", cmd("%s/\\s\\+$//g"), { exit = true, desc = "trim file's trailing \\s*" }, },
      { "t", cmd("terminal"), { exit = true, desc = ":terminal" }, },
      { "d", cmd("DataViewer"), { exit = true, desc = ":DataViewer" }, },

      { "<ESC>", nil, { exit = true, desc = "close" } },
      { "<CR>", nil, { exit = true, desc = "close" } },
    },
  })
  -- code
end

return {
  setup = setup,
}

