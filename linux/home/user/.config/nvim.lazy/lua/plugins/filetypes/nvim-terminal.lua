-- A high performance filetype mode for Neovim which leverages conceal
-- and highlights your buffer with the correct color codes
-- activate by `setl filetype=terminal`
return {
  "norcalli/nvim-terminal.lua",
  config = function() require("terminal").setup({}) end,
}
