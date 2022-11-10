-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- see https://github.com/wbthomason/packer.nvim#quickstart

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Look {{{

    -- Airline
    use {
      'vim-airline/vim-airline',
      requires = { 'vim-airline/vim-airline-themes' },
      config = function()
        vim.cmd [[
          let g:airline#extensions#tabline#enabled = 2
          let g:airline#extensions#tabline#fnamemod = ':t'
          let g:airline#extensions#tabline#left_sep = ' '
          let g:airline#extensions#tabline#left_alt_sep = '|'
          let g:airline#extensions#tabline#right_sep = ' '
          let g:airline#extensions#tabline#right_alt_sep = '|'
          let g:airline#extensions#csv#enabled = 0
          let g:airline_left_sep = ' '
          let g:airline_left_alt_sep = '|'
          let g:airline_right_sep = ' '
          let g:airline_right_alt_sep = '|'

          "let g:airline_theme= 'serene'
          let g:airline_theme= 'solarized_flood'
        ]]
      end,
    }

    -- Indent Blankline
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require("indentblankline")
      end,
    }

    -- colorschemes {{{

      use 'ishan9299/nvim-solarized-lua'
      -- see https://github.com/ishan9299/nvim-solarized-lua for details
      background = dark -- or light
      vim.g.solarized_italics = 1
      vim.g.solarized_termtrans = 1 -- transparent background

      use 'nanotech/jellybeans.vim'
      vim.g.jellybeans_use_term_italics = 1
      vim.g.jellybeans_overrides = {
          Search = { guifg = '000000', guibg= 'FFE792', ctermfg= '', ctermbg= '', attr= '' },
      }

      use 'tomasr/molokai'

      -- select colorscheme
      vim.cmd('colorscheme solarized')

    -- colorschemes }}}

  -- Look }}}

  -- UI {{{
    -- quick-menu
    use {
      'skywind3000/vim-quickui',
      config = function()
        vim.cmd[[
          call SourceConfig('quick-ui-menu.vim')
          call QuickUiMenuSetup()
        ]]
      end,
    }

    -- fzf (external reqreuiment: fzf)
    use {
      'ibhagwan/fzf-lua',
      -- optional for icon support
      requires = { 'kyazdani42/nvim-web-devicons' }
    }


  -- UI }}}


  -- General {{{
    -- treat Indent as object to select/operate
    use 'michaeljsmith/vim-indent-object'
    -- complete/id unicode/digraphs
    use 'chrisbra/unicode.vim'
  -- General }}}

  -- Programming Languages {{{
    -- syntax highlighting
    use 'sheerun/vim-polyglot'

    -- fold-cycle
    use {
      'jghauser/fold-cycle.nvim',
      config = function()
        require('fold-cycle').setup()
        vim.keymap.set('n', '<tab>',
          function() return require('fold-cycle').open() end,
          {silent = true, desc = 'Fold-cycle: open folds'})
        vim.keymap.set('n', '<s-tab>',
          function() return require('fold-cycle').close() end,
          {silent = true, desc = 'Fold-cycle: close folds'})
        vim.keymap.set('n', 'zC',
          function() return require('fold-cycle').close_all() end,
          {remap = true, silent = true, desc = 'Fold-cycle: close all folds'})

      end
    }

    -- matchup with %
    use {
      'andymass/vim-matchup',
      setup = function()
        -- may set any options here
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end
    }

    -- syntax parser
    -- use TSInstall to add languages
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
    }

  -- Programming Languages }}}


  require'nvim-treesitter.configs'.setup {
      matchup = {
          enable = true,              -- mandatory, false will disable the whole extension
          --disable = { "c", "ruby" },  -- optional, list of language that will be disabled
          -- [options]
      },
  }

end)

-- vim: set ft=lua foldmethod=marker sw=2 ts=2 sts=2 et :
