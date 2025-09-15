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

    km("n", "<localleader>c,", "<Plug>JumpDiffCharPrevStart",
      "[diffchar] JumpDiffCharPrevStart"
    )
    km("n", "<localleader>c.", "<Plug>JumpDiffCharNextStart",
      "[diffchar] JumpDiffCharNextStart"
    )
    km("n", "<localleader>c<lt>", "<Plug>JumpDiffCharPrevEnd",
      "[diffchar] JumpDiffCharPrevEnd"
    )
    km("n", "<localleader>c>", "<Plug>JumpDiffCharNextEnd",
      "[diffchar] JumpDiffCharNextEnd"
    )
    km("n", "<localleader>co", "<Plug>GetDiffCharPair",
      "[diffchar] GetDiffCharPair"
    )
    km("n", "<localleader>cp", "<Plug>PutDiffCharPair",
      "[diffchar] PutDiffCharPair"
    )

  end
}
