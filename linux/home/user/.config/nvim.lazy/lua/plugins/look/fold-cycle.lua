-- use <tab> to toggle folds
return {
  "jghauser/fold-cycle.nvim",
  enabled = true,
  config = function()
    local fc = require("fold-cycle")
    fc.setup()

    local km = require("utils").km -- keymap shortcut function
    km("n", "<tab>", function() return fc.open() end, "Fold-cycle: open folds")
    km("n", "<s-tab>", function() return fc.close() end, "Fold-cycle: close folds")
    -- TODO refactor the utils km
    -- vim.keymap.set(
    --   "n",
    --   "zC",
    --   function() return fc.close_all() end,
    --   { remap = true, silent = true, desc = "Fold-cycle: close all folds" }
    -- )
  end,
}
