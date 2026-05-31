-- hedyhli/outline.nvim
-- https://github.com/hedyhli/outline.nvim
-- Code outline window
--
return {
  "hedyhli/outline.nvim",

  config = function()

    local km = require("utils").km -- keymap shortcut function
    km({"n"}, "<LEADER>i", "<cmd>Outline<CR>", "toggle outlIne")

    require("outline").setup {
      -- Your setup opts here (leave empty to use defaults)
    }
  end,

}
