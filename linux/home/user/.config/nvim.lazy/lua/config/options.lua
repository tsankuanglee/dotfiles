local opt = vim.opt

-- remember the launching folder
vim.g.my_starting_folder=vim.fn.getcwd()
vim.g.lcd_to_starting_folder=function()
  vim.cmd('lcd' .. vim.g.my_starting_folder)
end

-- General {{{
opt.mouse:remove({ "a" }) -- disable mouse so we can use X terminal to copy and paste
opt.backspace = { "indent", "eol", "start" } -- Allow backspace over everything in insert mode.
opt.complete:remove({ "i" })
opt.smarttab = true

opt.nrformats:remove({ "octal" })

opt.ttimeout = true
opt.ttimeoutlen = 100

opt.autoread = false -- do not autoload when file updates
opt.autochdir = true

opt.history = 1000
opt.tabpagemax = 50
opt.undolevels = 200

opt.shortmess:append('I') -- no splash screen

-- Path/file expansion in command mode
opt.wildmenu = true
opt.wildmode = "list:longest"
--opt.wildchar = vim.fn.char2nr("\t") -- <TAB> is already default

-- providers (remove line to enable)
--vim.g.loaded_perl_provider = 0
-- turn off unnecessary providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- }}} General

-- indent {{{
-- opt.autoindent = false
-- opt.smartindent = true
opt.cindent = true -- fix the bug of non-indented #

--- }}} indent

-- Search {{{
opt.hlsearch = true -- Highlight search results.
opt.incsearch = true -- Incremental search.
opt.magic = true -- Use 'magic' patterns (extended regular expressions).
-- }}} Search

-- tools {{{
-- diff
--opt.diffopt:append("iwhite") -- ignore whitespaces

-- spell
opt.spelllang="en,cjk" -- add cjk so they are excluded from spell checking
opt.spellsuggest="best,9"

-- rg / grep
opt.grepprg = "rg --line-number --vimgrep "
-- TODO fd path

-- Look {{{

opt.showcmd = true -- Show (partial) command in status line.
opt.showmatch = true -- Show matching brackets.
opt.showmode = true -- Show current mode.
opt.ruler = true -- Show the line and column numbers of the cursor.
opt.number = true -- Show the line numbers on the left side.
opt.cursorline = true -- Highlight the current line number
opt.formatoptions:append({ "o" }) -- Continue comment marker in new lines.
opt.textwidth = 0 -- Hard-wrap long lines as you type them.

opt.expandtab = true -- Insert spaces when <TAB> is pressed.
opt.softtabstop = -1 -- # of spaces that a Tab char counts (if et=true then it's not a Tab char; use <c-v><tab> to do insert a real tab
opt.tabstop = 2 -- # of spaces for TAB char rednered from file
opt.shiftwidth = 2 -- Indentation amount for < and > commands.

opt.errorbells = false -- No beeps.
opt.modeline = true -- Enable modeline.
opt.linespace = 0 -- Set line-spacing to minimum.
opt.joinspaces = false -- Prevents inserting two spaces after punctuation on a join (J)

-- More natural splits
opt.splitbelow = true -- Horizontal split below current.
opt.splitright = true -- Vertical split to right of current.

opt.startofline = false -- Do not jump to first character with page commands.

-- Tell Vim which characters to show for expanded TABs,
-- trailing whitespace, and end-of-lines. VERY useful!
opt.listchars = {
  tab = "> ",
  trail = "␣", -- "∙-",
  extends = "▶", -- ">",
  precedes = "◀", -- "<",
  nbsp = "󱁐", -- "+",
  -- eol = "¶",
}
-- opt.showbreak = "↪ " -- show line wrap
opt.list = true -- Show problematic characters.
opt.fillchars:append({
  lastline = ""
})
opt.display:append({ "lastline" })

opt.termguicolors = true -- true color support
vim.cmd([[
  highlight NonText ctermfg=16 guifg=#4a4a59
  highlight SpecialKey ctermfg=16 guifg=#4a4a59
  highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
  match ExtraWhitespace /\s\+$\|\t/
]])
-- }}} Look

-- Configuration {{{
-- vim.cmd([[
--
--   if has('path_extra')
--     setglobal tags-=./tags tags^=./tags;
--   endif
--
--   " if !empty(&viminfo)
--   "   set viminfo^=!        " Write a viminfo file with registers.
--   " endif
--   " set sessionoptions-=options
--
--   " " Allow color schemes to do bright colors without forcing bold.
--   " if &t_Co == 8 && $TERM !~# '^linux'
--   "   set t_Co=16
--   " endif
--
-- ]])
-- }}} Configuration

-- vim: foldmethod=marker
