-- ibhagwan/fzf-lua
-- https://github.com/ibhagwan/fzf-lua
-- Improved fzf.vim written in lua
--
-- require fzf binary
return {
  keys = {
    { "<LEADER>zf", "<CMD>FzfLua files<CR>", mode = "n" },
    { "<LEADER>zo", "<CMD>FzfLua oldfiles<CR>", mode = "n" },
    { "<LEADER>zb", "<CMD>FzfLua buffers<CR>", mode = "n" },
    { "<LEADER>zt", "<CMD>FzfLua tabs<CR>", mode = "n" },
    { "<LEADER>zj", "<CMD>FzfLua jumps<CR>", mode = "n" },
    { "<LEADER>zq", "<CMD>FzfLua quickfix<CR>", mode = "n" },
    { "<LEADER>zQ", "<CMD>FzfLua quickfix_stack<CR>", mode = "n" },
    { "<LEADER>zc", "<CMD>FzfLua loclist<CR>", mode = "n" },
    { "<LEADER>zC", "<CMD>FzfLua loclist_stack<CR>", mode = "n" },
    { "<LEADER>zl", "<CMD>FzfLua lines<CR>", mode = "n" },
    { "<LEADER>zB", "<CMD>FzfLua blines<CR>", mode = "n" },
    { "<LEADER>za", "<CMD>FzfLua args<CR>", mode = "n" },
    { "<LEADER>zH", "<CMD>FzfLua command_history<CR>", mode = "n" },
    { "<LEADER>zm", "<CMD>FzfLua commands<CR>", mode = "n" },
    { "<LEADER>zZ", "<CMD>FzfLua builtin<CR>", mode = "n" },
    { "<LEADER>zz", "<CMD>FzfLua global<CR>", mode = "n" },
    { "<LEADER>z/", "<CMD>FzfLua grep<CR>", mode = "n" },
    { "<LEADER>zg", "<CMD>FzfLua live_grep<CR>", mode = "n" },
    { "<LEADER>zr", "<CMD>FzfLua resume<CR>", mode = "n" },
    { "<LEADER>zK", "<CMD>FzfLua colorschemes<CR>", mode = "n" },
    { "<LEADER>lzr", "<CMD>FzfLua lsp_references<CR>", mode = "n" },
    { "<LEADER>lzd", "<CMD>FzfLua lsp_definitions<CR>", mode = "n" },
    { "<LEADER>lzD", "<CMD>FzfLua lsp_declarations<CR>", mode = "n" },
    { "<LEADER>lzt", "<CMD>FzfLua lsp_typedefs<CR>", mode = "n" },
    { "<LEADER>lzi", "<CMD>FzfLua lsp_implementations<CR>", mode = "n" },
    { "<LEADER>lzsd", "<CMD>FzfLua lsp_document_symbols<CR>", mode = "n" },
    { "<LEADER>lzsw", "<CMD>FzfLua lsp_workspace_symbols<CR>", mode = "n" },
    { "<LEADER>lzsl", "<CMD>FzfLua lsp_live_workspace_symbols<CR>", mode = "n" },
    { "<LEADER>lzc", "<CMD>FzfLua lsp_code_actions<CR>", mode = "n" },
    { "<LEADER>lzI", "<CMD>FzfLua lsp_incoming_calls<CR>", mode = "n" },
    { "<LEADER>lzO", "<CMD>FzfLua lsp_outgoing_calls<CR>", mode = "n" },
    { "<LEADER>lzf", "<CMD>FzfLua lsp_finder<CR>", mode = "n" },
    { "<LEADER>lzgd", "<CMD>FzfLua lsp_document_diagnostics<CR>", mode = "n" },
    { "<LEADER>lzgw", "<CMD>FzfLua lsp_workspace_diagnostics<CR>", mode = "n" },
    { "<F1>", "<CMD>FzfLua help_tags<CR>", mode = {"n", "v", "i", "c"} },
  },
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    local fzflua = require("fzf-lua")
    fzflua.register_ui_select() -- use fzf-lua for vim.ui.select





    -- LSP (also see nvim-lspconfig.lua)





    -- improve native functions

  end,
}
