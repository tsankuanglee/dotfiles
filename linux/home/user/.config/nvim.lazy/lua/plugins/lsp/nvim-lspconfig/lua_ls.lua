local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local setup = function()
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
end

return {
  setup = setup,
}
