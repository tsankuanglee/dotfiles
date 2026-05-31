-- chrisgrieser/nvim-various-textobjs
-- https://github.com/chrisgrieser/nvim-various-textobjs
-- Bundle of more than 30 new text objects
return {
  "chrisgrieser/nvim-various-textobjs",
  lazy = false,
  opts = {
    keymaps = {
      useDefaults = true,
      disabledDefaults = {
        "L", -- this clashes with movement L (to screen bottom)
        "al", -- markdown link; clash with vim-match up loop
        "il", -- markdown link; clash with vim-match up loop
        "am", -- chainMember; clash with vim-match up loop
        "im", -- chainMember; clash with vim-match up loop
        "r", -- duplication of `V}`
      }
    },
  },
}
