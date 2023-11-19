local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

local setup = function()
  lspconfig.pyright.setup({
    capabilities = capabilities,
    filetypes = { "python" },
  })
end

return {
  setup = setup,
}
