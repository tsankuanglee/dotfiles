-- vidocqh/data-viewer.nvim
-- https://github.com/vidocqh/data-viewer.nvim
-- csv/squite view as table
return {
  keys = {
    { "<LEADER>D", "<CMD>DataViewer<CR>", mode = "n", desc = "Open CSV/sqlite viewer" },
  },
  "vidocqh/data-viewer.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kkharji/sqlite.lua", -- Optional, sqlite support
  },
  config = function()
    local dv = require("data-viewer")
    dv.setup({
      view = {
        float = true,
      },
      keymap = {
        quit = "q",
        next_table = "<C-l>",
        prev_table = "<C-h>",
      },
    })
  end,
}
