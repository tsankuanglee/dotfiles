-- automatically highlighting other uses of the word under the cursor
-- using either LSP, Tree-sitter, or regex matching
-- You'll also get <a-n> and <a-p> as keymaps to move between references
-- and <a-i> as a textobject for the reference illuminated under the cursor.
local auto_highlight_change = function()
  -- reset highlighting after each ColorScheme change
  local augroup = vim.api.nvim_create_augroup("illuminate", { clear = false })
  local change_highlight = function()
    vim.cmd([[
      highlight IlluminatedWordWrite guibg=#204b17
      highlight IlluminatedWordRead guibg=#204b17
      highlight IlluminatedWordText guibg=#204b17
      highlight illuminatedCurWord guibg=#204b17
      highlight illuminatedWord guibg=#204b17
      ]])
  end
  vim.api.nvim_create_autocmd("ColorScheme", { group = augroup, callback = change_highlight })
  return change_highlight
end

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
      min_count_to_highlight = 1,
    })

    -- change highlight and register autocmd for colorscheme change
    auto_highlight_change()()
  end,
}
