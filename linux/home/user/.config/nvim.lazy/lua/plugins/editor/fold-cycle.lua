return {
  "jghauser/fold-cycle.nvim",
  config = function()
    require("fold-cycle").setup()
    local km = require("utils").km -- keymap shortcut function
    km(
      "n",
      "<tab>",
      function() return require("fold-cycle").open() end,
      "Fold-cycle: open folds"
    )
    km(
      "n",
      "<s-tab>",
      function() return require("fold-cycle").close() end,
      { silent = true, desc = "Fold-cycle: close folds" }
    )
    -- TODO refactor the utils km
    vim.keymap.set(
      "n",
      "zC",
      function() return require("fold-cycle").close_all() end,
      { remap = true, silent = true, desc = "Fold-cycle: close all folds" }
    )
  end,
}
