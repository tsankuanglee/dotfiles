-- auto join, split code block elements
return {
  "Wansmer/treesj",
  keys = {
    "<LOCALLEADER>m", -- auto toggle
    "<LOCALLEADER>j", -- join
    "<LOCALLEADER>s", -- split
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup({--[[ your config ]]
    })
  end,
}
