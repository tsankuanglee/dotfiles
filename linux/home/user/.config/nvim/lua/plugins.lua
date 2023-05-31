-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- see https://github.com/wbthomason/packer.nvim#quickstart

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

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

  -- Movement {{{
    -- fold-cycle{{{
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
    }-- }}}

    -- matchup with %{{{
    use {
      'andymass/vim-matchup',
      setup = function()
        -- may set any options here
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end
    }-- }}}

    -- repeat motions {{{
    use {
      'Houl/repmo-vim',
      config = function()
        vim.cmd( [[
          "" map a motion and its reverse motion:
          "noremap <expr> h repmo#SelfKey('h', 'l')|sunmap h
          "noremap <expr> l repmo#SelfKey('l', 'h')|sunmap l

          "" if you like `:noremap j gj', you can keep that:
          "map <expr> j repmo#Key('gj', 'gk')|sunmap j
          "map <expr> k repmo#Key('gk', 'gj')|sunmap k

          " word
          noremap <expr> w repmo#SelfKey('w', 'b')|sunmap w
          noremap <expr> b repmo#SelfKey('b', 'w')|sunmap b
          noremap <expr> e repmo#SelfKey('e', 'ge')|sunmap e
          " WORD
          noremap <expr> W repmo#SelfKey('W', 'B')|sunmap W
          noremap <expr> B repmo#SelfKey('B', 'W')|sunmap B
          noremap <expr> E repmo#SelfKey('E', 'gE')|sunmap E


          " repeat the last [count]motion or the last zap-key:
          map <expr> ; repmo#LastKey(';')|sunmap ;
          map <expr> , repmo#LastRevKey(',')|sunmap ,

          " add these mappings when repeating with `;' or `,':
          noremap <expr> f repmo#ZapKey('f')|sunmap f
          noremap <expr> F repmo#ZapKey('F')|sunmap F
          noremap <expr> t repmo#ZapKey('t')|sunmap t
          noremap <expr> T repmo#ZapKey('T')|sunmap T

          noremap <expr> <C-E> repmo#SelfKey('<C-E>', '<C-Y>')
          noremap <expr> <C-Y> repmo#SelfKey('<C-Y>', '<C-E>')
        ]] )
      end,
    }
    -- }}}
  -- Movement }}}

  -- Editing {{{
    -- treat Indent as object to select/operate
    use 'michaeljsmith/vim-indent-object'
    -- complete/id unicode/digraphs
    use 'chrisbra/unicode.vim'
    -- surround " ' ` ( tags [ { etc.
    -- this one has the full features the neovim counterparts don't
    use {
      'tpope/vim-surround',
      requires = {
        -- repeat Plugin commands
        'tpope/vim-repeat'
      }
    }
  -- Editing }}}

  -- utilities {{{
    use 'jamessan/vim-gnupg'
  -- utilities }}}

  -- Programming Languages {{{
    -- syntax highlighting{{{
    use 'sheerun/vim-polyglot'
    -- }}}


    -- syntax parser{{{
    -- use TSInstall to add languages
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
      config = function()
        require'nvim-treesitter.configs'.setup {
          matchup = {
            enable = true,              -- mandatory, false will disable the whole extension
            --disable = { "c", "ruby" },  -- optional, list of language that will be disabled
            -- [options]
          },
        }
      end
    } -- }}}

    -- snippets{{{
    use {
      'hrsh7th/vim-vsnip',
      requires = {
        {'hrsh7th/vim-vsnip-integ'},
        {'rafamadriz/friendly-snippets', branch = 'main' }
      },
      config = function()
        vim.cmd( [[
          " Expand
          imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
          smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

          " Expand or jump
          imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
          smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

          " Jump forward or backward
          imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
          smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
          imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
          smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

          " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
          " See https://github.com/hrsh7th/vim-vsnip/pull/50
          nmap        s   <Plug>(vsnip-select-text)
          xmap        s   <Plug>(vsnip-select-text)
          nmap        S   <Plug>(vsnip-cut-text)
          xmap        S   <Plug>(vsnip-cut-text)

          " If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
          "let g:vsnip_filetypes = {}
          "let g:vsnip_filetypes.javascriptreact = ['javascript']
          "let g:vsnip_filetypes.typescriptreact = ['typescript']

        ]] )
      end,

    }-- }}}

  -- Programming Languages }}}

end)

-- vim: set ft=lua foldmethod=marker sw=2 ts=2 sts=2 et :
