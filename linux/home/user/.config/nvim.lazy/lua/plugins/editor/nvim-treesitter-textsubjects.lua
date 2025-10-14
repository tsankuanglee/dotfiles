-- Location and syntax aware text objects which *do what you mean*
-- keys: (after v, V, C-V, etc.)
-- ;  will select a syntactical container (class, function, etc.) depending on your location in the syntax tree.
-- i; will select the body of a syntactical container depending on your location in the syntax tree.
-- .  will select the most relevant part of the syntax tree depending on your location in it.
-- ,  to repeat the last selection.
return {
  "RRethy/nvim-treesitter-textsubjects",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "VeryLazy",
  lazy = true,
  config = function()
    local textsubjects = require("nvim-treesitter-textsubjects")
    textsubjects.configure({
      prev_selection = ',',
      keymaps = {
        ['.'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
        ['i;'] = 'textsubjects-container-inner',
      },
    })
  end,
}
