-- Bundle of two dozen new text objects for Neovim
-- https://neovimcraft.com/plugin/chrisgrieser/nvim-various-textobjs
--
return {
  "chrisgrieser/nvim-various-textobjs",
  lazy = false,
  opts = {
    useDefaultKeymaps = true,
    disabledKeymaps = {
      "L", -- this clashes with movement L (to screen bottom)
      "al", -- markdown link; clash with vim-match up loop
      "il", -- markdown link; clash with vim-match up loop
      "am", -- chainMember; clash with vim-match up loop
      "im", -- chainMember; clash with vim-match up loop
      "r", -- duplication of `V}`
    },
  },
}
