-- Better Folding

-- There are two options: we can use LSP or treesitter as the provider
local provider = "LSP" -- or treesitter

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "neovim/nvim-lspconfig",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  },
  config = function()
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

    -- There are two options: we can use LSP or treesitter as the provider

    if provider == "LSP" then
      -- option 2: nvim lsp as lsp client
      -- tell the server the capability of foldingrange,
      -- neovim hasn't added foldingrange to default capabilities, users must add it manually
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingrange = {
        dynamicregistration = false,
        linefoldingonly = true,
      }
      local language_servers = lspconfig.util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        lspconfig[ls].setup({
          capabilities = capabilities,
          -- you can add other fields for setting up lsp server in this table
        })
      end
      require("ufo").setup()
    else
      -- Option 3: treesitter as a main provider instead
      -- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
      -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
      require("ufo").setup({
        provider_selector = function(_, _, _) return { "treesitter", "indent" } end,
      })
    end
  end,
}
