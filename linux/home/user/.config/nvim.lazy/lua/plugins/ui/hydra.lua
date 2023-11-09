-- Create custom submodes and menus
return {
  "anuvyklack/hydra.nvim",
  -- event = "VeryLazy",
  config = function ()
    require("plugins.ui.hydra.sidescroll").setup()
    require("plugins.ui.hydra.options").setup()
    require("plugins.ui.hydra.action").setup()
    -- require("buffer")
    -- require("window")
  end,
}
