-- multicursors
-- "<LOCALLEADER>mc" to start the main cursor, then use arrow keys (not hjkl) to move around, and use <C-N> to mark more cursors
return {
  "smoka7/multicursors.nvim",
  dependencies = {
    "smoka7/hydra.nvim",
  },
  lazy = true,
  event = "VeryLazy",
  opts = {},
  cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  keys = {
    { mode = { "v", "n" }, "<LOCALLEADER>mc", "<cmd>MCunderCursor<cr>", desc = "[multicursors] start char on cursor" },
    { mode = { "v", "n" }, "<LOCALLEADER>mw", "<cmd>MCstart<cr>", desc = "[multicursors] start, on cursor/selection" },
    { mode = { "v", "n" }, "<LOCALLEADER>mv", "<cmd>MCvisual<cr>", desc = "[multicursors] start, on selection" },
    {
      mode = { "v", "n" },
      "<LOCALLEADER>mB",
      "<cmd>MCpattern<cr>",
      desc = "[multicursors] prompt pattern; match all in buffer",
    },
    {
      mode = { "v", "n" },
      "<LOCALLEADER>mV",
      "<cmd>MCvisualPattern<cr>",
      desc = "[multicursors] prmopt pattern; match all in selection",
    },
    { mode = { "v", "n" }, "<LOCALLEADER>mx", "<cmd>MCclear<cr>", desc = "[multicursors] clear selection" },
  },
  config = function()
    local mc = require("multicursors")
    mc.setup({})

    require("utils").run_and_register_highlight_change(
      "multicursors",
      function()
        vim.cmd([[
          highlight MultiCursor     guifg=#000000 guibg=#aaaaaa
          highlight MultiCursorMain guifg=#000000 guibg=#ffffff
          ]])
      end
    )
  end,
}
