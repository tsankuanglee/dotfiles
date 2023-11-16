--

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

    -- custom highlight
    local auto_highlight_change = function()
      -- reset highlighting after each ColorScheme change
      local augroup = vim.api.nvim_create_augroup("multicursors", { clear = false })
      local change_highlight = function()
        vim.cmd([[
          highlight MultiCursor     guifg=#000000 guibg=#aaaaaa
          highlight MultiCursorMain guifg=#000000 guibg=#ffffff
        ]])
      end
      vim.api.nvim_create_autocmd("ColorScheme", { group = augroup, callback = change_highlight })
      return change_highlight
    end
    auto_highlight_change()()

  end,
}
