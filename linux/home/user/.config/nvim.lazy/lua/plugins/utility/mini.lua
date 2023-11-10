-- 30+ independent Lua modules improving overall Neovim experience with minimal effort
return {
  "echasnovski/mini.nvim",
  version = false,
  lazy = true,
  config = function()
    -- stick with oil, since folder-column-view is not intuitive in copying out filelist
    --require("plugins.utility.mini.mini-files").custom_setup()
  end,
}
