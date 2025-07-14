-- configurations for NVIM LSP
return {
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
    local lspconfig = require("lspconfig")
    require("plugins.lsp.nvim-lspconfig.pyright").setup()
    require("plugins.lsp.nvim-lspconfig.lua_ls").setup()
    lspconfig.ts_ls.setup {}
    lspconfig.vale_ls.setup {}

    -- keymaps
    local km = require("utils").km -- keymap shortcut function
    km("n", "<LEADER>lr", vim.lsp.buf.references, "references")
    km("n", "<LEADER>ld", vim.lsp.buf.definition, "definition")
    km("n", "<LEADER>lD", vim.lsp.buf.declaration, "Declaration")
    km("n", "<LEADER>lt", vim.lsp.buf.type_definition, "type definition")
    km("n", "<LEADER>li", vim.lsp.buf.implementation, "implementation")

    km("n", "<LEADER>lh", vim.lsp.buf.hover, "hover/help")

    km("n", "<LEADER>lR", vim.lsp.buf.rename, "refactor/rename")

    km("n", "<LEADER>lc", vim.lsp.buf.code_action, "code_action")

    km("n", "<LEADER>lF", vim.lsp.buf.format, "built-in formatter")

    km("n", "<LEADER>lgf", vim.diagnostic.open_float, "open float")
    km("n", "<LEADER>lgw", vim.diagnostic.setloclist, "setloclist")

    -- fzf version: see fzf-lua.lua config (<LEADER>lz)
  end,
}
