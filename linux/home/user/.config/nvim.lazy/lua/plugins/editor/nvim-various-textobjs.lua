-- there are many types of objects. See
-- https://neovimcraft.com/plugin/chrisgrieser/nvim-various-textobjs
return {
  "chrisgrieser/nvim-various-textobjs",
  lazy = false,
  opts = {
    useDefaultKeymaps = true,
    disabledKeymaps = {
      "L", -- this clashes with movement L (to screen bottom)
    },
  },
}
