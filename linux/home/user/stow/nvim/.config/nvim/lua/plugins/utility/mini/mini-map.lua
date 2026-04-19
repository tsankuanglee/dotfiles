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
  local km = require("utils").km -- keymap shortcut function
  km('n', '<Leader>mt', MiniMap.toggle, "[mini.map] toggle")
  km('n', '<Leader>mc', MiniMap.close, "[mini.map] close")
  km('n', '<Leader>mo', MiniMap.open, "[mini.map] open")
  km('n', '<Leader>mf', MiniMap.toggle_focus, "[mini.map] toggle_focus")
  km('n', '<Leader>mr', MiniMap.refresh, "[mini.map] refresh")
  km('n', '<Leader>ms', MiniMap.toggle_side, "[mini.map] toggle_side")
end

return {
  custom_setup = custom_setup
}
