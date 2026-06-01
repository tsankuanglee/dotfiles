-- hedyhli/outline.nvim
-- https://github.com/hedyhli/outline.nvim
-- Code outline window
--
return {
  keys = {
    { "<LEADER>i", "<cmd>Outline<CR>", mode = {"n"}, desc = "toggle outlIne" },
  },
  "hedyhli/outline.nvim",

  config = function()


    require("outline").setup {
      -- Your setup opts here (leave empty to use defaults)
    }
  end,

}
