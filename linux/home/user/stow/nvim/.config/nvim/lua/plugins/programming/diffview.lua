-- sindrets/diffview.nvim
-- https://github.com/sindrets/diffview.nvim
-- Single tabpage interface for easily cycling through diffs
--
-- diffview for git
return {
  "https://github.com/sindrets/diffview.nvim",
  lazy = true,
  event = {"VeryLazy"},
  config = function()
    local diffview = require("diffview")
    diffview.setup({})
  end
}

