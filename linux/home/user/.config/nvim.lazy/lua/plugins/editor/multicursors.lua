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
    { mode = { "v", "n" }, "<LOCALLEADER>mc", "<cmd>MCunderCursor<cr>", desc = "[multicursor] start char on cursor", },
    { mode = { "v", "n" }, "<LOCALLEADER>mw", "<cmd>MCstart<cr>", desc = "[multicursor] start, on cursor/selection", },
    { mode = { "v", "n" }, "<LOCALLEADER>mv", "<cmd>MCvisual<cr>", desc = "[multicursor] start, on selection", },
    { mode = { "v", "n" }, "<LOCALLEADER>mB", "<cmd>MCpattern<cr>", desc = "[multicursor] prompt pattern; match all in buffer", },
    { mode = { "v", "n" }, "<LOCALLEADER>mV", "<cmd>MCvisualPattern<cr>", desc = "[multicursor] prmopt pattern; match all in selection", },
    { mode = { "v", "n" }, "<LOCALLEADER>mx", "<cmd>MCclear<cr>", desc = "[multicursor] clear selection", },
  },
  config = function()
    local mc = require("multicursors")
    mc.setup({})
  end
}
