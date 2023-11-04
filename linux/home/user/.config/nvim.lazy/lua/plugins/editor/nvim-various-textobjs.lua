-- Bundle of two dozen new text objects for Neovim
-- https://neovimcraft.com/plugin/chrisgrieser/nvim-various-textobjs
--
return {
  "chrisgrieser/nvim-various-textobjs",
  lazy = false,
  opts = {
    useDefaultKeymaps = true,
    disabledKeymaps = {
      "S", -- subword, clashing
      --"r", duplication of `V}`
      "L", -- this clashes with movement L (to screen bottom)
    },
  },
}
