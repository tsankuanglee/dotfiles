-- require fzf binary
return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    local fzflua = require("fzf-lua")
    -- use fzf-lua for vim.ui.select
    fzflua.register_ui_select()

    local km = require("utils").km -- keymap shortcut function
    km("n", "<LEADER>zf", "<CMD>FzfLua files<CR>")
    km("n", "<LEADER>zb", "<CMD>FzfLua buffers<CR>")
    km("n", "<LEADER>zo", "<CMD>FzfLua oldfiles<CR>")
    km("n", "<LEADER>zq", "<CMD>FzfLua quickfix<CR>")
    km("n", "<LEADER>zQ", "<CMD>FzfLua quickfix_stack<CR>")
    km("n", "<LEADER>zc", "<CMD>FzfLua loclist<CR>")
    km("n", "<LEADER>zC", "<CMD>FzfLua loclist_stack<CR>")
    km("n", "<LEADER>zj", "<CMD>FzfLua jumps<CR>")
    km("n", "<LEADER>zl", "<CMD>FzfLua lines<CR>")
    km("n", "<LEADER>zB", "<CMD>FzfLua blines<CR>")
    km("n", "<LEADER>zt", "<CMD>FzfLua tabs<CR>")
    km("n", "<LEADER>za", "<CMD>FzfLua args<CR>")
    km("n", "<LEADER>zH", "<CMD>FzfLua command_history<CR>")
    km("n", "<LEADER>zm", "<CMD>FzfLua commands<CR>")
    km("n", "<LEADER>zz", "<CMD>FzfLua builtin<CR>")

    km("n", "<LEADER>z/", "<CMD>FzfLua grep<CR>")
    km("n", "<LEADER>zg", "<CMD>FzfLua live_grep<CR>")

    km("n", "<LEADER>zr", "<CMD>FzfLua resume<CR>")

    -- LSP (also see nvim-lspconfig.lua)
    km("n", "<LEADER>lzr", "<CMD>FzfLua lsp_references<CR>")
    km("n", "<LEADER>lzd", "<CMD>FzfLua lsp_definitions<CR>")
    km("n", "<LEADER>lzD", "<CMD>FzfLua lsp_declarations<CR>")
    km("n", "<LEADER>lzt", "<CMD>FzfLua lsp_typedefs<CR>")
    km("n", "<LEADER>lzi", "<CMD>FzfLua lsp_implementations<CR>")

    km("n", "<LEADER>lzsd", "<CMD>FzfLua lsp_document_symbols<CR>")
    km("n", "<LEADER>lzsw", "<CMD>FzfLua lsp_workspace_symbols<CR>")
    km("n", "<LEADER>lzsl", "<CMD>FzfLua lsp_live_workspace_symbols<CR>")

    km("n", "<LEADER>lzc", "<CMD>FzfLua lsp_code_actions<CR>")

    km("n", "<LEADER>lzI", "<CMD>FzfLua lsp_incoming_calls<CR>")
    km("n", "<LEADER>lzO", "<CMD>FzfLua lsp_outgoing_calls<CR>")
    km("n", "<LEADER>lzf", "<CMD>FzfLua lsp_finder<CR>")

    km("n", "<LEADER>lzgd", "<CMD>FzfLua lsp_document_diagnostics<CR>")
    km("n", "<LEADER>lzgw", "<CMD>FzfLua lsp_workspace_diagnostics<CR>")
  end,
}
