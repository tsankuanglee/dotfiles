# NVIM
My NVIM config has diverged from vim, which I rarely use nowadays except for occassional work on a system without it.

# Personal usage analysis

Rarely used keys are candidates to be re-assigned.

## built-in keys that are never used

`S`
`s`
`R`

`ctrl-j`
`ctrl-q`
`ctrl-m`
`-`
`+`
`ctrl-a`
`ctrl-x`
`_`

## rarely used

`c`
`C`
`K`


## unused by VIM

`\\`
`ctrl-K`

# File Structure

./init.lua
    main config file. It imports specified `./lua/*`

./lua/util/
./lua/util/init.lua
    common config utilities

./lua/config/
    base configurations

./lua/config/autocmds.lua
./lua/config/keymaps.lua
./lua/config/options.lua
    basic vim/nvim configs

./lua/config/lazy.lua
    package manager

./stylua.toml

./lua/plugins/
    all files with `.lua` are loaded (but some have `lazy=true`).

./lua/plugins/completion/
    snippets, auto-complete
    * ./lua/plugins/completion/nvim-cmp.lua
        complete engine
    * ./lua/plugins/completion/LuaSnip.lua
        snippets

./lua/plugins/editor/
    movement, objects, editting

    * ./lua/plugins/editor/fold-cycle.lua
        toggle nested folds
    * ./lua/plugins/editor/nvim-surround.lua
        easily add `() {} [] <div>`, etc.
    * ./lua/plugins/editor/vim-matchup.lua
        extend % key to move between programming pair-ends (if/else, end, etc.)
    * ./lua/plugins/editor/repmo-vim
        repeat movement with ; ,
    * objects
        * ./lua/plugins/editor/nvim-treesitter-textobjects.lua
        * ./lua/plugins/editor/nvim-treesitter-textsubjects.lua
        * ./lua/plugins/editor/nvim-various-textobjs.lua


./lua/plugins/look/
    visual interface
./lua/plugins/look/colorschemes.lua
    various colorschemes
./lua/plugins/look/bufferline.lua
    top bufferline
    TODO only show it when there are more than one buffer
./lua/plugins/look/lualine.lua
    bottom status line
./lua/plugins/look/rainbow-delimiters.lua
    colorful `{} () [] etc`
./lua/plugins/look/indent-blankline.lua
    colorful indent markers

./lua/plugins/programming/
* ./lua/plugins/programming/treesitter.lua

* ./lua/plugins/programming/Comment.lua
    * quickly add comment with `gc` (comment) `gb` (block comment)
* ./lua/plugins/programming/vim-gnupg.lua
    * decrypt gnupg file and encrypt it after saving

./lua/plugins/ui/
    user interface
    * ./lua/plugins/ui/quick-ui-menu.lua
        user-defined menu at the top for common tasks
    * ./lua/plugins/ui/which-key.lua

    * ./lua/plugins/ui/fzf-lua.lua

    * ./lua/plugins/ui/telescope.lua

./lua/plugins/utility/
    * ./lua/plugins/utility/nvim-startup.lua
        use `nvim --startuptime /tmp/nvim-startuptime` to generate timing profile
    * ./lua/plugins/utility/oil.lua
        easy explorer with buffer-filelist direct edit
    * ./lua/plugins/utility/nvim-tree.lua.off
        Quite good, but missing some features I use:
            * copy the file listing quite often
            * switch back and forth between editor and explorer


# TODO
    * LSP
    * personal snippets

# potential plugins


