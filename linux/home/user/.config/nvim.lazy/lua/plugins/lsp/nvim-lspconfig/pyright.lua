local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

local setup = function()
  lspconfig.pyright.setup({
    capabilities = capabilities,
    filetypes = { "python" },

    -- -- debug stdin/stdout
    -- cmd = {
    --   "/usr/bin/sh",
    --   "~/.local/bin/pyright-langserver",
    --   "--stdio",
    -- },
    -- -- cmd = {
    -- --   "docker",
    -- --   "exec",
    -- --   "-i",
    -- --   "vscode-python-1",
    -- --   ".local/bin/pyright-langserver/pyright-langserver",
    -- --   "--stdio",
    -- -- },
    -- settings = {
    --   python = {
    --     analysis = {
    --       autoSearchPaths = true,
    --       useLibraryCodeForTypes = true,
    --       diagnosticMode = "openFilesOnly",
    --     },
    --   },
    -- },
    -- root_dir = function ()
    --   return '/home/user/project/pwd'
    -- end,
    -- before_init = function(params) params.processId = vim.NIL end,
    -- handlers = {
    --   -- ["textDocument/definition"] = function(err, result, method, ...)
    --   --   if vim.tbl_islist(result) then
    --   --     -- local filter = function(v) return string.match(v.targetUri, "%.d.ts") == nil end
    --   --     local filter = function(v)
    --   --       v.targetUri = v.targetUri.replac
    --   --       -- return string.match(v.targetUri, "%.d.ts") == nil
    --   --     end
    --   --     result = vim.tbl_filter(filter, result)
    --   --   end
    --   --
    --   --   vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
    --   -- end,
    -- },
  })
end

return {
  setup = setup,
}
