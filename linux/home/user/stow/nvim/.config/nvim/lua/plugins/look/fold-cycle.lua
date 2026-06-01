-- jghauser/fold-cycle.nvim
-- https://github.com/jghauser/fold-cycle.nvim
-- Cycle through folds
--
-- use <tab> to toggle folds, one level at a time
return {
  keys = {
    { "<LEADER><tab>", function() return fc.open() end, mode = "n", desc = "Fold-cycle: open folds" },
    { "<LEADER><s-tab>", function() return fc.close() end, mode = "n", desc = "Fold-cycle: close folds" },
    { "zC", function() return fc.close_all() end, mode = "n", desc = "Fold-cycle: close all folds under cursor" },
  },
  "jghauser/fold-cycle.nvim",
  lazy = true,
  event = { "VeryLazy" },
  enabled = true,
  config = function()
    local fc = require("fold-cycle")
    fc.setup({
      open_if_max_closed = true, -- closing a fully closed fold will open it
      close_if_max_opened = true, -- opening a fully open fold will close it
      softwrap_movement_fix = false, -- set to true for Neovim < 0.9
    })

  end,
}
