-- virtual text support to nvim-dap
-- nvim-treesitter is used to find variable definitions.
return {
  "theHamsta/nvim-dap-virtual-text",
  depenencies = {
    "mfussenegger/nvim-dap",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = true,
  event = { "VeryLazy" },
  config = function()
    local vt = require("nvim-dap-virtual-text")
    vt.setup()
  end,
}
