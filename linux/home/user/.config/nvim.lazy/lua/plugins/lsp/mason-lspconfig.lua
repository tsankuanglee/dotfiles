return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    'neovim/nvim-lspconfig',
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "rust_analyzer",
      },
    })
  end,
}
