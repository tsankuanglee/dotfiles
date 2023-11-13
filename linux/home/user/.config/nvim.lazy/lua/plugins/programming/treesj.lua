-- auto join, split code block elements
return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    local tsj = require("treesj")
    tsj.setup({
      use_default_keymaps = false,
    })
    local km = require("utils").km -- keymap shortcut function
      km('n', '<LOCALLEADER>j', require('treesj').toggle, "TreeSJ split-join toggle")
  end,
}
