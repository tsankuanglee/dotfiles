-- diffchar: Highlight the exact differences, based on characters and words
return {
  'rickhowe/diffchar.vim',
  -- Note (lazy loading):
  -- additional lazy config to defer loading is not really needed...
  event = "BufRead",
  init = function()
    -- disable default mappings
    vim.g.DiffCharDoMapping = 0
  end,
  config = function()
    local km = require("utils").km -- keymap shortcut function

    km("n", "<localleader>f,", "<Plug>JumpDiffCharPrevStart",
      "[diffchar] JumpDiffCharPrevStart"
    )
    km("n", "<localleader>f.", "<Plug>JumpDiffCharNextStart",
      "[diffchar] JumpDiffCharNextStart"
    )
    km("n", "<localleader>f<lt>", "<Plug>JumpDiffCharPrevEnd",
      "[diffchar] JumpDiffCharPrevEnd"
    )
    km("n", "<localleader>f>", "<Plug>JumpDiffCharNextEnd",
      "[diffchar] JumpDiffCharNextEnd"
    )
    km("n", "<localleader>fg", "<Plug>GetDiffCharPair",
      "[diffchar] GetDiffCharPair"
    )
    km("n", "<localleader>fp", "<Plug>PutDiffCharPair",
      "[diffchar] PutDiffCharPair"
    )

  end
}
