-- csv/squite view as table
return {
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
    local km = require("utils").km -- keymap shortcut function
    km("n", "<LEADER>D", "<CMD>DataViewer<CR>", "Open CSV/sqlite viewer")
  end,
}
