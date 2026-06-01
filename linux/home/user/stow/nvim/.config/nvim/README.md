# NVIM (formerly VIM/NVIM)
My NVIM config has deviated from vim, which I rarely use nowadays except for occassional work on a system without nvim. That said, key-wise, I try to keep the original keys as much as possible so I don't lose my portability.

The configs here will be transient until I figure out a smooth workflow, which could be never. :)

# Directory structure and plugins

(may not reflect the latest version)
```
├─ init.lua * main config file. It imports specified `./lua/*`
├─ lazy-lock.json * locked plugin versions; use Lazy Restore to use locked plugins
├─ lua
│  ├─ config * base nvim native configurations and Lazy package manager
│  │  ├─ autocmds.lua
│  │  ├─ keymaps.lua * basic keymaps for builtin features
│  │  ├─ lazy.lua * Bootstrap lazy.nvim
│  │  └─ options.lua
│  ├─ plugins * all files with `.lua` are loaded
│  │  ├─ completion
│  │  │  ├─ LuaSnip.lua * Snippet Engine
│  │  │  ├─ cmp-nvim-lsp.lua * nvim-cmp source for neovim builtin LSP client
│  │  │  └─ nvim-cmp.lua * A completion plugin
│  │  ├─ editor * movement, objects, editting
│  │  │  ├─ bookmarks.lua * Bookmark manager
│  │  │  ├─ diffchar.vim.lua * Highlight exact character differences
│  │  │  ├─ diffunitsyntax.lua * Highlight word or character based diff units in diff format
│  │  │  ├─ flash.lua * Navigate code with search labels
│  │  │  ├─ grug-far.lua * Find and replace with ripgrep
│  │  │  ├─ hex.lua * Hex editing mode
│  │  │  ├─ mini-ai.lua * Extend and create a/i textobjects
│  │  │  ├─ mini-surround.lua * Fast and feature-rich surround actions
│  │  │  ├─ multicursor.lua * Multiple cursors for Neovim
│  │  │  ├─ nvim-treesitter.lua.off * Tree-sitter based syntax highlighting and parsing for Neovim
│  │  │  ├─ nvim-various-textobjs.lua * Bundle of more than 30 new text objects
│  │  │  ├─ spotdiff.vim.lua * Quickly jump to the next different hunks in diff mode
│  │  │  ├─ telescope-undo.lua * A better Telescope picker for undo
│  │  │  └─ wrapfiller.lua * align wrapped text in diff
│  │  ├─ filetypes
│  │  │  ├─ baleia.lua * Colorize text with ANSI escape sequences
│  │  │  ├─ data-viewer.lua * better CSV viewer
│  │  │  ├─ nvim-dap-python.lua * Extension for nvim-dap providing default configurations for python
│  │  │  ├─ stylua-nvim.lua * code formatter for lua
│  │  │  └─ vim-gnupg.lua * Plugin for transparent editing of gpg encrypted files
│  │  ├─ look * visual interface
│  │  │  ├─ barbar.lua * Improved tabs look
│  │  │  ├─ colorschemes.lua * managing colorschemes
│  │  │  ├─ fold-cycle.lua * Cycle through folds
│  │  │  ├─ indent-blankline.lua * Indent guides
│  │  │  ├─ lualine.lua * configurable neovim statusline
│  │  │  ├─ nvim-ufo.lua * Ultra fold in Neovim
│  │  │  ├─ qfview.lua * Better alignment for quickfix/location window
│  │  │  ├─ rainbow-delimiters.lua * colorized vertical indent guides
│  │  │  ├─ satellite.lua * Scrollbar with signs
│  │  │  └─ statuscol.lua * Status column plugin provides a status column on the left
│  │  ├─ lsp
│  │  │  ├─ conform.lua * Lightweight yet powerful formatter plugin
│  │  │  ├─ mason-lspconfig.lua * Extension to mason.nvim that makes it easier to use lspconfig
│  │  │  ├─ mason.lua * Portable package manager for Neovim that runs everywhere Neovim runs
│  │  │  ├─ nvim-dap-ui.lua * A UI for nvim-dap
│  │  │  ├─ nvim-dap-virtual-text.lua * Virtual text support for nvim-dap
│  │  │  ├─ nvim-dap.lua * Debug Adapter Protocol client implementation
│  │  │  ├─ nvim-lint.lua.off * Asynchronous linter plugin
│  │  │  ├─ nvim-lspconfig
│  │  │  │  ├─ lua_ls.lua
│  │  │  │  └─ pyright.lua
│  │  │  ├─ nvim-lspconfig.lua * Quickstart configs for Nvim LSP
│  │  │  └─ outline.lua * Code outline window
│  │  ├─ programming
│  │  │  ├─ NotebookNavigator.lua.off * Navigate Jupyter notebooks
│  │  │  ├─ aerial.lua * A code outline window for skimming and quick navigation
│  │  │  ├─ ccc.lua * Color picker and highlighter
│  │  │  ├─ diffview.lua * Single tabpage interface for easily cycling through diffs
│  │  │  ├─ gitsigns.lua * Git integration for buffers
│  │  │  ├─ headlines.lua * Add highlights and background colors for headings of text filetypes, like markdown, orgmode, and neorg.
│  │  │  ├─ lazydev.lua
│  │  │  ├─ mini-splitjoin.lua * Split and join arguments/blocks
│  │  │  └─ vim-illuminate.lua * Automatically highlighting other uses of the word under the cursor
│  │  ├─ ui
│  │  │  ├─ dressing.lua * Neovim UI enhancements
│  │  │  ├─ fzf-lua.lua * Improved fzf.vim written in lua
│  │  │  ├─ hydra
│  │  │  │  ├─ action-apps.lua * actions and apps
│  │  │  │  ├─ buffer.lua
│  │  │  │  ├─ init.lua
│  │  │  │  ├─ options-ext.lua * Helper function to check if a value is in a table
│  │  │  │  ├─ options.lua
│  │  │  │  ├─ sidescroll.lua * side scrools: zh zl zH zL
│  │  │  │  └─ window.lua
│  │  │  ├─ hydra.lua * Create custom submodes and menus
│  │  │  ├─ nap.lua * Jump between next/prev quickly
│  │  │  ├─ nvim-bqf.lua.off * Better quickfix window
│  │  │  ├─ quick-ui-menu.lua * UI framework for vim/nvim
│  │  │  ├─ telescope-fzf-native.lua * FZF sorter for telescope
│  │  │  ├─ telescope.lua * Find, Filter, Preview, Pick
│  │  │  ├─ which-key.lua * Prompts available keys in a sequence
│  │  │  └─ winshift.lua * Rearrange your windows with ease
│  │  └─ utility
│  │     ├─ fcitx.lua * auto switch input method between insert/normal mode
│  │     ├─ mini
│  │     │  ├─ mini-files.lua * mini-files is a file explorer that featrues MacOS-column-view-like representation,
│  │     │  └─ mini-map.lua * mini.map shows a visual overview of buffer
│  │     ├─ mini.lua * 30+ independent Lua modules improving overall Neovim experience with minimal effort
│  │     ├─ nvim-nio.lua * A library for asynchronous IO
│  │     ├─ nvim-startup.lua.off
│  │     ├─ oil.lua * File explorer as a buffer
│  │     ├─ resession.lua * A replacement for :mksession with a better API
│  │     ├─ toggleterm.lua
│  │     └─ tome.lua
│  └─ utils * common config utilities
│     └─ init.lua * credit:
├─ README.md
└─ stylua.toml * lua formatting
```
# Tree-sitter

The nvim-treesitter plugin's author [quit the toxicity](https://github.com/nvim-treesitter/nvim-treesitter/discussions/8627#discussioncomment-16440673). While I respect the decision, so many plugins are affected.

nvim does start to support more and more treesitter features natively, but we are not quite there yet. In the meantime:

* reduced the number of plugins, especially those rarely used
* replaced older plugins, especially those haven't been updated for a while, with more recent ones
* Manually `TSInstall` needed language parsers (or turn on `./lua/plugins/editor/nvim-treesitter.lua.off` to install parsers, and then turn it off afterwards)


# TODO
* AI
    * https://github.com/Robitx/gp.nvim
    * https://github.com/terror/chatgpt.nvim
* git annotation
    * https://github.com/sindrets/diffview.nvim
* LSP: DAP
    * https://github.com/nvim-neotest/neotest
* keys https://github.com/rockerBOO/awesome-neovim#keybinding
    * https://github.com/mrjones2014/legendary.nvim
    * https://github.com/FeiyouG/commander.nvim

* remote/container dev https://github.com/rockerBOO/awesome-neovim#remote-development
    * https://github.com/jamestthompson3/nvim-remote-containers
    * https://github.com/chipsenkbeil/distant.nvim
* nvim server/client setup

# plugins under review
* https://github.com/stevearc/dressing.nvim
* https://github.com/MunifTanjim/nui.nvim
* https://github.com/windwp/nvim-autopairs
* https://github.com/b0o/schemastore.nvim
* [provide immediate navigation to important files](https://github.com/cbochs/grapple.nvim)
* [A simple statusline/winbar component that uses LSP to show your current code context.](https://github.com/SmiteshP/nvim-navic)
* [IDE-like breadcrumbs, out of the box](https://github.com/Bekaboo/dropbar.nvim)


