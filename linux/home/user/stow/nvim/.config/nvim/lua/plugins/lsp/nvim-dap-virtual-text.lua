-- theHamsta/nvim-dap-virtual-text
-- https://github.com/theHamsta/nvim-dap-virtual-text
-- Virtual text support for nvim-dap
--
-- virtual text support to nvim-dap
-- nvim-treesitter is used to find variable definitions.
return {
  "theHamsta/nvim-dap-virtual-text",
  dependencies = {
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
