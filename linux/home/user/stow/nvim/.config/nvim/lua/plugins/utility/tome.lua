--[[
Tome Playbook
https://github.com/laktak/tome
Playback commands for nvim, by sending keystrokes to tmux session
--]]
return {
  keys = {
    { "<leader>Tp", "<Plug>(TomePlayLine)", mode = "n", desc = "tome: play current line" },
    { "<leader>TP", "<Plug>(TomePlayParagraph)", mode = "n", desc = "tome: play current paragraph" },
    { "<leader>Tp", "<Plug>(TomePlaySelection)", mode = "x", desc = "tome: play selection" },
  },
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
  end
}
