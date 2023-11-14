-- configurations for NVIM LSP
return {
  "neovim/nvim-lspconfig",
  config = function()
    -- this needs to load before lspconfig
    require("neodev").setup({
      library = { plugins = { "nvim-dap-ui" }, types = true },
    })

    require("stylua-nvim").setup({ config_file = "stylua.toml" })

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    lspconfig.lua_ls.setup({
      commands = {
        -- external formatter
        Format = {
          function() require("stylua-nvim").format_file() end,
        },
      },
      capabilities = capabilities,
      filetypes = { "lua" },
      settings = {
        Lua = {
          -- internal formatter
          format = {
            enable = false,
            -- NOTE: the value should be String!
            defaultConfig = {
              indent_style = "space",
              indent_size = 2,
              column_width = 160,
            },
          },
          workspace = {
            checkThirdParty = false, -- turn off "Do you need to configure your work environment as `luv`?"
          },
        },
      },
    })
    local config = require("plugins.lsp.nvim-lspconfig")
    lspconfig.pyright.setup({
      on_attach = config.on_attach,
      capabilities = capabilities,
      filetypes = { "python" },
    })

    -- keymaps
    local km = require("utils").km -- keymap shortcut function
    km("n", "<LEADER>lr", vim.lsp.buf.references, "references")
    km("n", "<LEADER>ld", vim.lsp.buf.definition, "definition")
    km("n", "<LEADER>lD", vim.lsp.buf.declaration, "Declaration")
    km("n", "<LEADER>lt", vim.lsp.buf.type_definition, "type definition")
    km("n", "<LEADER>li", vim.lsp.buf.implementation, "implementation")

    km("n", "<LEADER>lh", vim.lsp.buf.hover, "hover/help")

    km("n", "<LEADER>lR", vim.lsp.buf.rename, "refactor/rename")
    -- km("n", "<F2>", vim.lsp.buf.rename, "refactor/rename")

    km("n", "<LEADER>lc", vim.lsp.buf.code_action, "code_action")

    km("n", "<LEADER>lF", vim.lsp.buf.format, "built-in formatter")

    km("n", "<LEADER>lgf", vim.diagnostic.open_float, "open float")
    km("n", "<LEADER>lgw", vim.diagnostic.setloclist, "setloclist")

    -- fzf version: see fzf-lua.lua config (<LEADER>lz)
  end,
}
