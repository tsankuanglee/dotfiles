-- which-key prompts available keys in a sequence

local setup = {
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
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  motions = {
    count = true,
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    zindex = 1000, -- positive value to position WhichKey above other floating windows.
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line

  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
  -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
  triggers_nowait = {
    -- marks
    --"`",
    --"'",
    "g`",
    "g'",
    -- registers
    '"',
    "<c-r>",
    -- spelling
    "z=",
  },
}

local leader_mappings = {
  name = "<LEADER>",
  -- we don't define the keys here, but it's helpful to give group names and prompts
  b = { name = "buffer switching" },
  C = { name = "colorscheme" },
  c = { name = "config" },
  e = { name = "Explorer" },
  f = { name = "Telescope" },
  F = {
    name = "file",
    t = "filetype",
  },
  M = { name = "menu" },
  N = {
    name = "NotebookNavigator",
  },
  l = {
    name = "LSP",
    s = "symbols",
    g = "diagnostics",
  },
  L = { name = "line num/wrap" },
  s = { name = "sessions; reg * (primary/select)" },
  t = { name = "tab switching" },
  z = { name = "fzf" },
  [":"] = { name = "commands" },
}

local localleader_mappings = {
  name = "<LOCALLEADER>",
  d = { name = "DAP" },
  j = { name = "TreeSJ" },
  m = { name = "MultiCursors" },
}

return {
  "folke/which-key.nvim",
  lazy = true,
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    mode = "n", -- NORMAL mode
    -- to be overwritten later
    --prefix = "<LEADER>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(setup)
    local leader_opts = vim.tbl_deep_extend("force", opts, { prefix = "<LEADER>" })
    wk.register(leader_mappings, leader_opts)
    local localleader_opts = vim.tbl_deep_extend("force", opts, { prefix = "<LOCALLEADER>" })
    wk.register(localleader_mappings, localleader_opts)

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
