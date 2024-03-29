-- The three "core" operations of add/delete/change can be done with the keymaps:
-- ys{motion}{char}, ds{char}, and cs{target}{replacement}, respectively
return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
}
