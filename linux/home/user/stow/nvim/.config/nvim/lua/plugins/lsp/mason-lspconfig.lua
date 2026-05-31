-- williamboman/mason-lspconfig.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
-- Extension to mason.nvim that makes it easier to use lspconfig
--
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
        "jsonls",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "ts_ls",
      },
    })
  end,
}
