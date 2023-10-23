return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  lazy = false,
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup()
  end
}
-- vim: ft=lua foldmethod=marker sw=2 ts=2 sts=2 et
