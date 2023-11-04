-- Location and syntax aware text objects which *do what you mean*
return {
  "RRethy/nvim-treesitter-textsubjects",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "VeryLazy",
  lazy = true,
  config = function()
    require("nvim-treesitter.configs").setup({
      textsubjects = {
        enable = true,
        prev_selection = "<C-p>", -- (Optional) keymap to select the previous selection
        keymaps = {
          ["@"] = "textsubjects-smart",
          ["-"] = "textsubjects-container-outer",
          ["_"] = { "textsubjects-container-inner", desc = "Select inside containers (classes, functions, etc.)" },
        },
      },
    })
  end,
}
