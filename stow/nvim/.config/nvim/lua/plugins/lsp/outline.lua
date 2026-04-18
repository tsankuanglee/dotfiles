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
