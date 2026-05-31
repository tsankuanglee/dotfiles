return {
  "echasnovski/mini.splitjoin",
  event = "VeryLazy",
  opts = {
    -- Module mappings. Use `''` (empty string) to disable one.
    -- The default is `gS` to toggle split/join.
    mappings = {
      toggle = 'gS',
      split = '',
      join = '',
    },

    -- Custom join/split behaviors can be added here if needed, 
    -- but mini.splitjoin handles standard Lua, Python, JS, etc. out of the box
    -- without needing treesitter.
  },
}
