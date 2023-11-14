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
      km('n', '<LOCALLEADER>jt', require('treesj').toggle, "TreeSJ toggle")
      km('n', '<LOCALLEADER>jj', require('treesj').join, "TreeSJ join")
      km('n', '<LOCALLEADER>js', require('treesj').split, "TreeSJ split")
  end,
}
