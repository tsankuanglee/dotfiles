return {
  "laktak/tome",
  version = "*",
  opts = {},
  init = function()
    -- disable default mappings, which conflict with others
    vim.g.tome_no_mappings = 1
    -- no variable interpolation
    vim.g.tome_vars = 0
    vim.g.tome_target = 'tmux'
  end,
  config = function ()
    local km = require("utils").km -- keymap shortcut function
    km("n", "<leader>Tp", "<Plug>(TomePlayLine)", "tome: play current line")
    km("n", "<leader>TP", "<Plug>(TomePlayParagraph)", "tome: play current paragraph")
    km("x", "<leader>Tp", "<Plug>(TomePlaySelection)", "tome: play selection")
  end
}
