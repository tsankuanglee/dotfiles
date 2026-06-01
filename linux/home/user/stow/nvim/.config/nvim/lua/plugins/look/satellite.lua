-- lewis6991/satellite.nvim
-- https://github.com/lewis6991/satellite.nvim
-- Scrollbar with signs

local scrollbar_enabled = false
local function toggle_scrollbar()
  if scrollbar_enabled then
    vim.cmd(':SatelliteDisable')
  else
    vim.cmd(':SatelliteEnable')
  end

  scrollbar_enabled = not scrollbar_enabled
end

return {
  keys = {
    { "<LOCALLEADER>S", toggle_scrollbar, mode = "n", desc = "Toggle Satellite scrollbar" },
  },
  "lewis6991/satellite.nvim",
  event = "VeryLazy",
  config = function()
    local satellite = require("satellite")
    satellite.setup({})
    vim.cmd(':SatelliteDisable')
  end
}
