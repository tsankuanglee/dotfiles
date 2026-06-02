-- folke/which-key.nvim
-- https://github.com/folke/which-key.nvim
-- Prompts available keys in a sequence
local opts = {
  -- Sort alphabetically by key, ignoring whether it's a group or action
  sort = { "local", "alphanum", "mod" },
  ---@param mapping wk.Mapping
  filter = function(mapping)
    -- example to exclude mappings without a description
    -- return mapping.desc and mapping.desc ~= ""
    return true
  end,
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
}

local leader_mappings = {
  { "<LEADER>", group = "<LEADER>", nowait = true, remap = false },
  { "<LEADER>:", group = "commands", nowait = true, remap = false },
  { "<LEADER>b", group = "buffer switching", nowait = true, remap = false },
  { "<LEADER>B", group = "Bookmarks", nowait = true, remap = false },
  { "<LEADER>Bl", group = "Bookmarks lists actions", nowait = true, remap = false },
  { "<LEADER>C", group = "colorscheme", nowait = true, remap = false },
  { "<LEADER>c", group = "config", nowait = true, remap = false },
  { "<LEADER>e", group = "Explorer", nowait = true, remap = false },
  { "<LEADER>F", group = "file", nowait = true, remap = false },
  { "<LEADER>Ft", desc = "filetype", nowait = true, remap = false },
  { "<LEADER>f", group = "Telescope", nowait = true, remap = false },
  { "<LEADER>G", group = "Gitsigns", nowait = true, remap = false },
  { "<LEADER>L", group = "line num/wrap", nowait = true, remap = false },
  { "<LEADER>l", group = "LSP", nowait = true, remap = false },
  { "<LEADER>lg", desc = "diagnostics", nowait = true, remap = false },
  { "<LEADER>ls", desc = "symbols", nowait = true, remap = false },
  { "<LEADER>h", group = "Main Menu (Hydra)", nowait = true, remap = false },
  { "<LEADER>m", group = "mini.map", nowait = true, remap = false },
  { "<LEADER>N", group = "NotebookNavigator", nowait = true, remap = false },
  { "<LEADER>s", group = "sessions; reg * (primary/select)", nowait = true, remap = false },
  { "<LEADER>t", group = "tab switching", nowait = true, remap = false },
  { "<LEADER>T", group = "TOME (shell playbook)", nowait = true, remap = false },
  { "<LEADER>z", group = "fzf", nowait = true, remap = false },
}


local localleader_mappings = {
  { "<LOCALLEADER>", group = "<LOCALLEADER>", nowait = true, remap = false },
  { "<LOCALLEADER>d", group = "DAP", nowait = true, remap = false },
  { "<LOCALLEADER>g", group = "grug-far", nowait = true, remap = false },
  { "<LOCALLEADER>j", group = "TreeSJ", nowait = true, remap = false },
  { "<LOCALLEADER>m", group = "MultiCursors", nowait = true, remap = false },
}

return {
  keys = {
    { "<s-F1>", "<CMD>WhichKey<CR>", mode = "n", desc = "which-key top menu" },
    { "<s-F1>", "<CMD>WhichKey '' v<CR>", mode = "v", desc = "which-key top menu" },
    { "<s-F1>", "<CMD>WhichKey '' i<CR>", mode = "i", desc = "which-key top menu" },
    { "<s-F1>", "<CMD>WhichKey '' c<CR>", mode = "c", desc = "which-key top menu" },
    { "<F13>", "<CMD>WhichKey<CR>", mode = "n", desc = "which-key top menu" },
    { "<F13>", "<CMD>WhichKey '' v<CR>", mode = "v", desc = "which-key top menu" },
    { "<F13>", "<CMD>WhichKey '' i<CR>", mode = "i", desc = "which-key top menu" },
    { "<F13>", "<CMD>WhichKey '' c<CR>", mode = "c", desc = "which-key top menu" },
  },
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
    
    -- Actually apply the plugin configuration (sort, plugins, filter, etc.)
    wk.setup(opts)

    wk.add(leader_mappings, { prefix = "<LEADER>" })
    wk.add(localleader_mappings, { prefix = "<LOCALLEADER>" })

    -- gui can receive S-Function keys

    -- Terminal emulators interprets S-Function keys as F13, F14, etc.
  end,
}
