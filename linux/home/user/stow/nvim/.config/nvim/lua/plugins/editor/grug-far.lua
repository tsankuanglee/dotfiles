-- Find And Replace (with rg) interface
return {
  'MagicDuck/grug-far.nvim',
  -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
  -- additional lazy config to defer loading is not really needed...
  config = function()
    -- optional setup call to override plugin options
    -- alternatively you can set options with vim.g.grug_far = { ... }
    require('grug-far').setup({
      -- options, see Configuration section below
      -- there are no required options atm
    });

    local gf = require('grug-far')
    local km = require("utils").km -- keymap shortcut function

    km({"n", "x"}, "<localleader>gf", function()
        gf.open()
      end,
      "[grug-far] find and replace"
    )
    km({"n", "x"}, "<localleader>gv", function()
        gf.with_visual_selection()
      end,
      "[grug-far] find-and-replace within visual selection"
    )

  end
}
