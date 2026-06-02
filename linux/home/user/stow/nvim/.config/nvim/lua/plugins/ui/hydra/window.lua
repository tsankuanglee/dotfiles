local M = {}
M.setup = function()
  local Hydra = require("hydra")
  local cmd = require("hydra.keymap-util").cmd
  local builder = require("plugins.ui.hydra.hydra-builder")

  local move_col = {
    { key = "<LEFT>", action = cmd("WinShift left"), desc = "move step left", exit = true },
    { key = "<DOWN>", action = cmd("WinShift down"), desc = "move step down", exit = true },
    { key = "<UP>", action = cmd("WinShift up"), desc = "move step up", exit = true },
    { key = "<RIGHT>", action = cmd("WinShift right"), desc = "move step right", exit = true },
  }

  local move_cont_col = {
    { key = "<S-LEFT>", action = cmd("WinShift left"), desc = "continuous move left", exit = false },
    { key = "<S-DOWN>", action = cmd("WinShift down"), desc = "continuous move down", exit = false },
    { key = "<S-UP>", action = cmd("WinShift up"), desc = "continuous move up", exit = false },
    { key = "<S-RIGHT>", action = cmd("WinShift right"), desc = "continuous move right", exit = false },
  }

  local resize_col = {
    { key = "<C-h>", action = "<C-w><", desc= "continuous resize narrower", exit = false },
    { key = "<C-j>", action = "<C-w>-", desc= "continuous resize shorter", exit = false },
    { key = "<C-k>", action = "<C-w>+", desc= "continuous resize higher", exit = false },
    { key = "<C-l>", action = "<C-w>>", desc= "continuous resize wider", exit = false },
  }

  local heads = builder.generate_heads({ move_col, move_cont_col, resize_col })
  table.insert(heads, { "<SPACE>", nil, { exit = false, desc = "show menu"} })

  M.hydra = Hydra({
    name = "Window Management",
    hint = builder.generate_hint("Window Management", { move_col, move_cont_col, resize_col }),
    config = {
      invoke_on_body = false,
      hint = {
        offset = -1,
        float_opts = {},
      },
      exit = true,
      foreign_keys = nil,
      prepend_body_to_foreign_keys = true,
    },
    mode = "n",
    body = "<C-w>",
    heads = heads,
  })
end
M.activate = function()
  if M.hydra then M.hydra:activate() end
end

return M
