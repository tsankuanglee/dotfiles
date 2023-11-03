--[[
Rainbow delimiters (rainbow parenthesis) for Neovim with Tree-sitter

This previous incarnation of this plugin used to be a tree-sitter module, but
now it's a standalone plugin, that calls tree-sitter, but no longer needs to have a setting under tree-sitter.config.

]]
return {
  "HiPhish/rainbow-delimiters.nvim",
  event = { "BufReadPost", "BufNewFile" },
  lazy = true,
  enabled = true,
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")
    require("rainbow-delimiters.setup").setup({
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    })
  end,
}
