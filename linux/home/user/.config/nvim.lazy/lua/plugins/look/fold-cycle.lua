-- use <tab> to toggle folds, one level at a time
return {
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

    local km = require("utils").km -- keymap shortcut function
    km("n", "<tab>", function() return fc.open() end, "Fold-cycle: open folds")
    km("n", "<s-tab>", function() return fc.close() end, "Fold-cycle: close folds")
    km(
      "n",
      "zC",
      function() return fc.close_all() end,
      "Fold-cycle: close all folds under cursor",
      { remap = true }
    )
  end,
}
