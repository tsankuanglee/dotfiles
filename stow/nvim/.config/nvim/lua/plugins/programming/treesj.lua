-- auto join, split code block elements
return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    local tsj = require("treesj")
    tsj.setup({
      use_default_keymaps = false,
      -- max_join_length = 120,
    })
    local km = require("utils").km -- keymap shortcut function
      km('n', '<LOCALLEADER>jt', require('treesj').toggle, "TreeSJ toggle")
      km('n', '<LOCALLEADER>jT', function () require('treesj').toggle({ split = { recursive = true } }) end, "TreeSJ toggle recursively")
      km('n', '<LOCALLEADER>jj', require('treesj').join, "TreeSJ join")
      km('n', '<LOCALLEADER>jJ', function () require('treesj').join({ split = { recursive = true } }) end, "TreeSJ join recursively")
      km('n', '<LOCALLEADER>js', require('treesj').split, "TreeSJ split")
      km('n', '<LOCALLEADER>jS', function () require('treesj').split({ split = { recursive = true } }) end, "TreeSJ split recursively")
  end,
}
