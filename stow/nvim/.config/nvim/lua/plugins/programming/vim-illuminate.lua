-- automatically highlighting other uses of the word under the cursor
-- using either LSP, Tree-sitter, or regex matching
-- You'll also get <a-n> and <a-p> as keymaps to move between references
-- and <a-i> as a textobject for the reference illuminated under the cursor.
return {
  "RRethy/vim-illuminate",
  lazy = true,
  event = { "VeryLazy" },
  config = function()
    local illuminate = require("illuminate")
    illuminate.configure({
      -- under_cursor: whether or not to illuminate under the cursor
      under_cursor = true,
      -- min_count_to_highlight: minimum number of matches required to perform highlighting
      min_count_to_highlight = 2,
    })

    -- change highlight and register autocmd for colorscheme change
    local utils = require("utils")
    utils.run_and_register_highlight_change(
      "illuminate",
      function()
        vim.cmd([[
          highlight IlluminatedWordWrite guibg=#204b17
          highlight IlluminatedWordRead guibg=#204b17
          highlight IlluminatedWordText guibg=#204b17
          highlight illuminatedCurWord guibg=#204b17
          highlight illuminatedWord guibg=#204b17
          ]])
      end
    )
    local km = utils.km -- keymap shortcut function
    km(
      "n",
      "<LOCALLEADER>I",
      function() require("illuminate").toggle_visibility_buf() end,
      "[vim-illuminate] toggle visibility"
    )
  end,
}
