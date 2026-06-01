-- nvimtools/hydra.nvim
-- https://github.com/nvimtools/hydra.nvim
-- Create custom submodes and menus
return {
  "nvimtools/hydra.nvim",
  config = function ()
    require("utils.hydra.sidescroll").setup()
    require("utils.hydra.options").setup()
    require("utils.hydra.action-apps").setup()
    require("utils.hydra.window").setup()
    require("utils.hydra.buffer").setup()
  end,
}
