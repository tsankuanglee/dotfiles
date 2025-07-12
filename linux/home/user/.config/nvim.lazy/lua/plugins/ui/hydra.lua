-- Create custom submodes and menus
return {
  "nvimtools/hydra.nvim",
  --"tsankuanglee/hydra.nvim",
  --branch = "pass_along_body",
  -- event = "VeryLazy",
  config = function ()
    require("plugins.ui.hydra.sidescroll").setup()
    require("plugins.ui.hydra.options").setup()
    require("plugins.ui.hydra.action-apps").setup()
    require("plugins.ui.hydra.window").setup()
    -- require("buffer")
  end,
}
