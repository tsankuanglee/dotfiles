-- lewis6991/satellite.nvim
-- https://github.com/lewis6991/satellite.nvim
-- Scrollbar with signs
return {
  "lewis6991/satellite.nvim",
  lazy = true,
  event = {"VeryLazy"},
  config = function()
    local satellite = require("satellite")
    satellite.setup({})
  end
}

