-- which-key prompts available keys in a sequence

local opts = {
  ---@param mapping wk.Mapping
  filter = function(mapping)
    -- example to exclude mappings without a description
    -- return mapping.desc and mapping.desc ~= ""
    return true
  end,
}

local leader_mappings = {
  { "<LEADER>", group = "<LEADER>", nowait = true, remap = false },
  { "<LEADER>:", group = "commands", nowait = true, remap = false },
  { "<LEADER>C", group = "colorscheme", nowait = true, remap = false },
  { "<LEADER>F", group = "file", nowait = true, remap = false },
  { "<LEADER>Ft", desc = "filetype", nowait = true, remap = false },
  { "<LEADER>L", group = "line num/wrap", nowait = true, remap = false },
  { "<LEADER>M", group = "menu", nowait = true, remap = false },
  { "<LEADER>N", group = "NotebookNavigator", nowait = true, remap = false },
  { "<LEADER>b", group = "buffer switching", nowait = true, remap = false },
  { "<LEADER>c", group = "config", nowait = true, remap = false },
  { "<LEADER>e", group = "Explorer", nowait = true, remap = false },
  { "<LEADER>f", group = "Telescope", nowait = true, remap = false },
  { "<LEADER>l", group = "LSP", nowait = true, remap = false },
  { "<LEADER>lg", desc = "diagnostics", nowait = true, remap = false },
  { "<LEADER>ls", desc = "symbols", nowait = true, remap = false },
  { "<LEADER>s", group = "sessions; reg * (primary/select)", nowait = true, remap = false },
  { "<LEADER>t", group = "tab switching", nowait = true, remap = false },
  { "<LEADER>z", group = "fzf", nowait = true, remap = false },
}


local localleader_mappings = {
  { "<LOCALLEADER>", group = "<LOCALLEADER>", nowait = true, remap = false },
  { "<LOCALLEADER>d", group = "DAP", nowait = true, remap = false },
  { "<LOCALLEADER>j", group = "TreeSJ", nowait = true, remap = false },
  { "<LOCALLEADER>m", group = "MultiCursors", nowait = true, remap = false },
  { "<LOCALLEADER>g", group = "grug-far", nowait = true, remap = false },
}

return {
  "folke/which-key.nvim",
  lazy = true,
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = opts,

  config = function(_, opts)
    local wk = require("which-key")
    local leader_opts = vim.tbl_deep_extend("force", opts, { prefix = "<LEADER>" })
    wk.add(leader_mappings, leader_opts)
    local localleader_opts = vim.tbl_deep_extend("force", opts, { prefix = "<LOCALLEADER>" })
    wk.add(localleader_mappings, localleader_opts)

    local km = require("utils").km -- keymap shortcut function
    -- gui can receive S-Function keys
    km("n", "<s-F1>", "<CMD>WhichKey<CR>", "which-key top menu")
    km("v", "<s-F1>", "<CMD>WhichKey '' v<CR>", "which-key top menu")
    km("i", "<s-F1>", "<CMD>WhichKey '' i<CR>", "which-key top menu")
    km("c", "<s-F1>", "<CMD>WhichKey '' c<CR>", "which-key top menu")

    -- Terminal emulators interprets S-Function keys as F13, F14, etc.
    km("n", "<F13>", "<CMD>WhichKey<CR>", "which-key top menu")
    km("v", "<F13>", "<CMD>WhichKey '' v<CR>", "which-key top menu")
    km("i", "<F13>", "<CMD>WhichKey '' i<CR>", "which-key top menu")
    km("c", "<F13>", "<CMD>WhichKey '' c<CR>", "which-key top menu")
  end,
}
