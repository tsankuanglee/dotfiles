# NVIM (formerly VIM/NVIM)
My NVIM config has deviated from vim, which I rarely use nowadays except for occassional work on a system without nvim.

# File Structure

```
├─ init.lua * main config file. It imports specified `./lua/*`
├─ lazy-lock.json
├─ lua
│  ├─ config * base nvim native configurations and Lazy package manager
│  │  ├─ autocmds.lua
│  │  ├─ keymaps.lua
│  │  ├─ lazy.lua * main package manager
│  │  └─ options.lua
│  ├─ plugins * all files with `.lua` (that are defined in lazy.lua are loaded (but some have `lazy=true`).
│  │  ├─ completion
│  │  │  ├─ cmp-nvim-lsp.lua * add LSP to cmp
│  │  │  ├─ LuaSnip.lua * snippets engine
│  │  │  └─ nvim-cmp.lua * complete engine
│  │  ├─ editor * movement, objects, editting
│  │  │  ├─ fold-cycle.lua * toggle nested folds
│  │  │  ├─ nvim-surround.lua * easily add `() {} [] <div>`, etc.
│  │  │  ├─ nvim-treesitter-textobjects.lua * objects
│  │  │  ├─ nvim-treesitter-textsubjects.lua * objects
│  │  │  ├─ nvim-various-textobjs.lua * objects
│  │  │  ├─ repmo-vim * repeat movement with ; ,
│  │  │  └─ vim-matchup.lua * extend % key to move between programming pair-ends (if/else, end, etc.)
│  │  ├─ look * visual interface
│  │  │  ├─ bufferline.lua * top bufferline. TODO only show it when there are more than one buffer?
│  │  │  ├─ colorschemes.lua * various colorschemes
│  │  │  ├─ indent-blankline.lua * colorful indent markers
│  │  │  ├─ lualine.lua * bottom status line
│  │  │  └─ rainbow-delimiters.lua * colorful `{} () [] etc`
│  │  ├─ lsp
│  │  │  ├─ conform.lua * formatter manager
│  │  │  ├─ mason-lspconfig.lua * lsp config for mason
│  │  │  ├─ mason.lua * manager for LS, DAP, linter, formatter
│  │  │  ├─ nvim-dap.lua
│  │  │  ├─ nvim-dap-ui.lua
│  │  │  ├─ nvim-lint.lua.off * linter manager (a bit too noisy for now)
│  │  │  └─ nvim-lspconfig.lua * lsp config
│  │  ├─ programming
│  │  │  ├─ Comment.lua * quickly add comment with `gc` (comment) `gb` (block comment)
│  │  │  ├─ markdown-preview.lua * realtime preview markdown in browser
│  │  │  ├─ neodev.lua * nvim lua development
│  │  │  ├─ stylua-nvim.lua * lua formatter
│  │  │  ├─ treesitter.lua
│  │  │  └─ vim-gnupg.lua * decrypt gnupg file and encrypt it after saving
│  │  ├─ ui
│  │  │  ├─ fzf-lua.lua
│  │  │  ├─ quick-ui-menu.lua * user-defined menu at the top for common tasks
│  │  │  └─ which-key.lua
│  │  └─ utility
│  │     ├─ nvim-startup.lua * use `nvim --startuptime /tmp/nvim-startuptime` to generate timing profile
│  │     ├─ nvim-tree.lua.off * Quite good, but missing some features I use: 1. copy the file listing quite often 2. switch back and forth between editor and explorer
│  │     └─ oil.lua * easy explorer with buffer-filelist direct edit
│  └─ utils * common config utilities
│      └─ init.lua
├─ README.md
└─ stylua.toml * lua formatting
```

# TODO
* LSP: DAP
* personal snippets

# potential plugins


# Personal usage analysis

Rarely used keys are candidates to be re-assigned.

## built-in keys that are never used

`S`
`s`
`R`

`c-j`
`c-q`
`c-m`
`-`
`+`
`c-a`
`c-x`
`_`

## rarely used

`c`
`C`
`K`


## unused by VIM

`\\`
`c-K`

