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

