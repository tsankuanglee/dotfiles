-- rickhowe/diffchar.vim
-- https://github.com/rickhowe/diffchar.vim
-- Highlight exact character differences
return {
  keys = {
    { "<localleader>f,", "<Plug>JumpDiffCharPrevStart", mode = "n", desc = "[diffchar] JumpDiffCharPrevStart" },
    { "<localleader>f.", "<Plug>JumpDiffCharNextStart", mode = "n", desc = "[diffchar] JumpDiffCharNextStart" },
    { "<localleader>f<lt>", "<Plug>JumpDiffCharPrevEnd", mode = "n", desc = "[diffchar] JumpDiffCharPrevEnd" },
    { "<localleader>f>", "<Plug>JumpDiffCharNextEnd", mode = "n", desc = "[diffchar] JumpDiffCharNextEnd" },
    { "<localleader>fg", "<Plug>GetDiffCharPair", mode = "n", desc = "[diffchar] GetDiffCharPair" },
    { "<localleader>fp", "<Plug>PutDiffCharPair", mode = "n", desc = "[diffchar] PutDiffCharPair" },
  },
  'rickhowe/diffchar.vim',
  -- Note (lazy loading):
  -- additional lazy config to defer loading is not really needed...
  event = "BufRead",
  init = function()
    -- disable default mappings
    vim.g.DiffCharDoMapping = 0
  end,
  config = function()


  end
}
