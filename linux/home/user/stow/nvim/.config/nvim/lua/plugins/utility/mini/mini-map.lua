-- mini.map shows a visual overview of buffer
local custom_setup = function()
  local minimap = require("mini.map")
  minimap.setup({
    integrations = {
      minimap.gen_integration.builtin_search(),
      minimap.gen_integration.diff(),
      minimap.gen_integration.diagnostic(),
    },
    window = {
      focusable = false,
      side = "right",
      show_integration_count = true,
      width = 10,
      winblend = 95,
      zindex = 10,
    }
  })
end

return {
  keys = {
    { '<Leader>mt', function() require('mini.map').toggle() end, mode = 'n', desc = "[mini.map] toggle" },
    { '<Leader>mc', function() require('mini.map').close() end, mode = 'n', desc = "[mini.map] close" },
    { '<Leader>mo', function() require('mini.map').open() end, mode = 'n', desc = "[mini.map] open" },
    { '<Leader>mf', function() require('mini.map').toggle_focus() end, mode = 'n', desc = "[mini.map] toggle_focus" },
    { '<Leader>mr', function() require('mini.map').refresh() end, mode = 'n', desc = "[mini.map] refresh" },
    { '<Leader>ms', function() require('mini.map').toggle_side() end, mode = 'n', desc = "[mini.map] toggle_side" },
  },
  custom_setup = custom_setup
}
