local M = {}
M.setup = function()
  local Hydra = require("hydra")
  local cmd = require("hydra.keymap-util").cmd
  local builder = require("plugins.ui.hydra.hydra-builder")

  local actions_col = {
    { key = ".", action = cmd("'<,'>s/\\./ /g"), desc = "replace . with space", exit = true },
    { key = "$", action = cmd("%s/\\s\\+$//g"), desc = "trim file trailing \\\\s*", exit = true },
    {}, -- Blank separator row
    {}, -- Another blank separator row
  }

  local apps_col = {
    { key = "t", action = cmd("terminal"), desc = ":terminal", exit = true },
    { key = "c", action = cmd("CsvViewToggle"), desc = ":CsvViewToggle", exit = true },
    { key = "a", action = cmd("AerialToggle!"), desc = ":AerialToggle!", exit = true },
    { key = "A", action = cmd("AerialNavToggle"), desc = ":AerialNavToggle", exit = true },
    { key = "L", action = cmd("Lazy"), desc = ":Lazy", exit = true },
    { key = "M", action = cmd("Mason"), desc = ":Mason", exit = true },
  }

  M.hydra = Hydra({
    name = "Actions",
    hint = builder.generate_hint("Actions & Apps", { actions_col, apps_col }),
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
    heads = builder.generate_heads({ actions_col, apps_col }),
  })
end

M.activate = function()
  if M.hydra then M.hydra:activate() end
end

return M
