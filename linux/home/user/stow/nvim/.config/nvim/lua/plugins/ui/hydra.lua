-- nvimtools/hydra.nvim
-- https://github.com/nvimtools/hydra.nvim
-- Create custom submodes and menus
return {
  "nvimtools/hydra.nvim",
  config = function ()
    require("plugins.ui.hydra.sidescroll").setup()
    require("plugins.ui.hydra.options").setup()
    require("plugins.ui.hydra.action-apps").setup()
    require("plugins.ui.hydra.window").setup()
    require("plugins.ui.hydra.buffer").setup()
    require("plugins.ui.hydra.hydra-main").setup()
  end,
}
