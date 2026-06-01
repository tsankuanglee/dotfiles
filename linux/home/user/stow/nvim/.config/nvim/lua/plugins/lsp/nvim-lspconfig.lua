-- neovim/nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig
-- Quickstart configs for Nvim LSP
--
-- configurations for NVIM LSP
return {
  keys = {
    { "<LEADER>lr", function() vim.lsp.buf.references() end, mode = "n", desc = "references" },
    { "<LEADER>ld", function() vim.lsp.buf.definition() end, mode = "n", desc = "definition" },
    { "<LEADER>lD", function() vim.lsp.buf.declaration() end, mode = "n", desc = "Declaration" },
    { "<LEADER>lt", function() vim.lsp.buf.type_definition() end, mode = "n", desc = "type definition" },
    { "<LEADER>li", function() vim.lsp.buf.implementation() end, mode = "n", desc = "implementation" },
    { "<LEADER>lh", function() vim.lsp.buf.hover() end, mode = "n", desc = "hover/help" },
    { "<LEADER>lR", function() vim.lsp.buf.rename() end, mode = "n", desc = "refactor/rename" },
    { "<LEADER>lc", function() vim.lsp.buf.code_action() end, mode = "n", desc = "code_action" },
    { "<LEADER>lF", function() vim.lsp.buf.format() end, mode = "n", desc = "built-in formatter" },
    { "<LEADER>lgf", function() vim.diagnostic.open_float() end, mode = "n", desc = "open float" },
    { "<LEADER>lgw", function() vim.diagnostic.setloclist() end, mode = "n", desc = "setloclist" },
  },
  "neovim/nvim-lspconfig",
  config = function()
    -- this needs to load before lspconfig
    --require("lazydev").setup({
    --  library = { plugins = { "nvim-dap-ui" }, types = true },
    --})
    require("lazydev").setup({
      library = { "nvim-dap-ui" },
    })
    require("stylua-nvim").setup({ config_file = "stylua.toml" })

    -- config for each language
    --
    -- deprecated syntax
    -- local lspconfig = require("lspconfig")
    -- require("plugins.lsp.nvim-lspconfig.pyright").setup()
    -- require("plugins.lsp.nvim-lspconfig.lua_ls").setup()
    -- lspconfig.ts_ls.setup {}
    -- lspconfig.vale_ls.setup {}

    vim.lsp.enable({ "pyright", "lua_ls", "ts_ls", "vale_ls" })

    -- keymaps






    -- fzf version: see fzf-lua.lua config (<LEADER>lz)
  end,
}
