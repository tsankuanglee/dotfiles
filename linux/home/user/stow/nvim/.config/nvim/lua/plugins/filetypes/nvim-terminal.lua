-- norcalli/nvim-terminal.lua
-- https://github.com/norcalli/nvim-terminal.lua
-- A high-performance neovim terminal filetype mode (for color)

-- activate by `setl filetype=terminal`
return {
  "norcalli/nvim-terminal.lua",
  config = function() require("terminal").setup({}) end,
}
