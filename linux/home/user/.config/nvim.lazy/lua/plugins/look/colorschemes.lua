-- colortheme
-- remember to set lazy=false for at least one of them
local km = require("utils").km -- keymap shortcut function

km("n", "<LEADER>Ct", "<CMD>colorscheme tokyonight<CR>")
km("n", "<LEADER>Cs", "<CMD>colorscheme solarized<CR>")
km("n", "<LEADER>Cg", "<CMD>colorscheme gruvbox<CR>")
km("n", "<LEADER>Cc", "<CMD>colorscheme catppuccin<CR>")
km("n", "<LEADER>Cj", "<CMD>colorscheme jellybeans<CR>")
km("n", "<LEADER>Cm", "<CMD>colorscheme molokai<CR>")

vim.opt.termguicolors = true -- true color support

local M = {
  {
    "ishan9299/nvim-solarized-lua",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark" -- or light
      vim.g.solarized_italics = 1
      vim.g.solarized_termtrans = 1 -- transparent background
      vim.g.solarized_diffmode = "high"

      vim.cmd([[colorscheme solarized]])
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        -- use the night style
        style = "night",
        transparent = true,
        -- disable italic for functions
        styles = {
          functions = {},
        },
        --on_colors = function(colors)
        --  colors.hint = colors.orange
        --  colors.error = "#ff0000"
        --end
      })
      --vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    priority = 1000,
    config = function() vim.cmd([[colorscheme gruvbox]]) end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    priority = 1000,
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
    config = function() vim.cmd([[colorscheme catppuccin]]) end,
  },

  {
    "nanotech/jellybeans.vim",
    lazy = true,
    priority = 1000,
    config = function()
      vim.g.jellybeans_use_term_italics = 1
      vim.g.jellybeans_overrides = {
        Search = { guifg = "000000", guibg = "FFE792", ctermfg = "", ctermbg = "", attr = "" },
      }
      vim.cmd([[colorscheme jellybeans]])
    end,
  },
  {
    "tomasr/molokai",
    lazy = true,
    priority = 1000,
    config = function() vim.cmd([[colorscheme molokai]]) end,
  },
}

return M
