-- spotdiff.vim: range and area selectable diff
-- Available commands 
--   for line range selection: :[range]Diffthis, :Diffoff[!], :Diffupdate
--   for visual selection: :VDiffthis, :VDiffoff, and :VDiffupdate
-- keybinds:
--   * diffchar works with this
return {
  'rickhowe/spotdiff.vim',
  event = "BufRead",
  init = function()
    -- disable default mappings
    vim.g.VDiffDoMapping = 0
  end,
  config = function()
    local km = require("utils").km -- keymap shortcut function

    -- See diffchar's bindings, which also work here

    km("n", "<localleader>ft", "<Plug>(VDiffthis)",
      "[spotdiff] VDiffthis"
    )
    km("n", "<localleader>fT", "<Plug>(VDiffthis!)",
      "[spotdiff] VDiffthis! (separated)"
    )
    km("n", "<localleader>fo", "<Plug>(VDiffoff)",
      "[spotdiff] VDiffoff"
    )
    km("n", "<localleader>fO", "<Plug>(VDiffoff!)",
      "[spotdiff] VDiffoff!"
    )
    km("n", "<localleader>fr", "<Plug>(VDiffupdate)",
      "[spotdiff] refresh"
    )

  end
}
