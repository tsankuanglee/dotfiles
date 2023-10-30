return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    plugins = {
      marks = false, -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
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
  },
  config = function()
    local wk = require("which-key")
    wk.register({
      -- we don't define the keys here, but it's helpful to give group names and prompts
      b = { name = "buffer switching" },
      C = { name = "colorscheme" },
      c = { name = "config" },
      e = { name = "Explorer" },
      l = {
        name = "LSP",
        s = "symbols",
        g = "diagnostics"
      },
      M = { name = "menu" },
      L = { name = "line num/wrap" },
      s = { name = "selection/primary paste (reg *)" },
      t = { name = "tab switching" },
      z = { name = "fzf" },
      [":"] = { name = "commands" },
      f = {
        name = "file",
        t = "filetype",
      },
    }, { prefix = "<leader>" })
  end,
}
