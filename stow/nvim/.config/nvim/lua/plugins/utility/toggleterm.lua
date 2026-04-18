--[[
multi nvim-terminals management
* Use <C-q> to open/toggle
* Use 2<C-q> to open/toggle Terminal 2
* Use 3<C-q> to open/toggle Terminal 3
* Use <C-S-q> to leave Terminal mode
* Use <C-S-q> for ui to select terminal
]]
return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {},
  config = function ()
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      open_mapping = [[<c-q>]],
      -- size can be a number or function which is passed the current terminal
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.5
        else
          return 20
        end
      end,
      direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float',
      hide_numbers = false,
      winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end
      },
    })

    local km = require("utils").km -- keymap shortcut function
    km("n", "<c-S-q>", "<CMD>TermSelect<CR>")

    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<C-S-q>', [[<C-\><C-n>]], opts)
      -- vim.keymap.set('t', '<c-h>', [[<Cmd>wincmd h<CR>]], opts)
      -- vim.keymap.set('t', '<c-j>', [[<Cmd>wincmd j<CR>]], opts)
      -- vim.keymap.set('t', '<c-k>', [[<Cmd>wincmd k<CR>]], opts)
      -- vim.keymap.set('t', '<c-l>', [[<Cmd>wincmd l<CR>]], opts)
      -- vim.keymap.set('t', '<c-w>', [[<C-\><C-n><C-w>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    -- vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
  end

}
