-- echasnovski/mini.nvim
-- https://github.com/echasnovski/mini.nvim
-- 30+ independent Lua modules improving overall Neovim experience with minimal effort
return {
  "echasnovski/mini.nvim",
  version = false,
  lazy = true,
  keys = (function()
    local k = {}
    vim.list_extend(k, require("plugins.utility.mini.mini-map").keys or {})
    -- vim.list_extend(k, require("plugins.utility.mini.mini-files").keys or {})
    return k
  end)(),
  config = function()
    -- stick with oil, since folder-column-view is not intuitive in copying out filelist
    --require("plugins.utility.mini.mini-files").custom_setup()

    require("plugins.utility.mini.mini-map").custom_setup()
  end,

}
