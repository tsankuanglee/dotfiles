--[[
rickhowe/spotdiff.vim
https://github.com/rickhowe/spotdiff.vim
Range and area selectable diff

Available commands 
  * for line range selection: :[range]Diffthis, :Diffoff[!], :Diffupdate
  * for visual selection: :VDiffthis, :VDiffoff, and :VDiffupdate
keybinds:
  * diffchar works with this
--]]
return {
  keys = {
    { "<localleader>ft", "<Plug>(VDiffthis)", mode = "n", desc = "[spotdiff] VDiffthis" },
    { "<localleader>fT", "<Plug>(VDiffthis!)", mode = "n", desc = "[spotdiff] VDiffthis! (separated)" },
    { "<localleader>fo", "<Plug>(VDiffoff)", mode = "n", desc = "[spotdiff] VDiffoff" },
    { "<localleader>fO", "<Plug>(VDiffoff!)", mode = "n", desc = "[spotdiff] VDiffoff!" },
    { "<localleader>fr", "<Plug>(VDiffupdate)", mode = "n", desc = "[spotdiff] refresh" },
  },
  'rickhowe/spotdiff.vim',
  event = "BufRead",
  init = function()
    -- disable default mappings
    vim.g.VDiffDoMapping = 0
  end,
  config = function()

    -- See diffchar's bindings, which also work here


  end
}
