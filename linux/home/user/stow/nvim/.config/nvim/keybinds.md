# Neovim Keybindings

## Normal Mode

| Key | Action / Description |
|-----|----------------------|
| `<Space>/` | [Flash] search (wrap) |
| `<Space>C` | Colorize ANSI text |
| `<Space>d<Down>` | [DAP] go doen stacktrace |
| `<Space>d<Up>` | [DAP] go up stacktrace |
| `<Space>dB` | [DAP] set breakpoint |
| `<Space>db` | [DAP] toggle breakpoint (also <F9>) |
| `<Space>dC` | [DAP] close session |
| `<Space>dc` | [DAP] Start/Continue <F5> |
| `<Space>dD` | [DAP] disconnect from debuggee |
| `<Space>dE` | [DAP] toggle REPL |
| `<Space>de` | [DAP-ui] eval cursor/visual |
| `<Space>dF` | [DAP-ui] select float |
| `<Space>df` | [DAP] frames |
| `<Space>dh` | [DAP] hover |
| `<Space>di` | [DAP] step into <F11> |
| `<Space>dl` | [DAP] Log Point |
| `<Space>do` | [DAP] step out <S-F11> |
| `<Space>dp` | [DAP] preview |
| `<Space>dq` | [DAP] terminate |
| `<Space>drc` | [DAP] run to cursor |
| `<Space>drl` | [DAP] run last |
| `<Space>drn` | [DAP] run (debug test cases) |
| `<Space>drs` | [DAP] restart |
| `<Space>ds` | [DAP] scopes |
| `<Space>dT` | [DAP] clear breakpoints |
| `<Space>dt` | [DAP] list breakpoints |
| `<Space>duc` | [DAP-ui] close UI |
| `<Space>duo` | [DAP-ui] open UI |
| `<Space>dur` | [DAP-ui] open reset UI |
| `<Space>dut` | [DAP-ui] toggle UI |
| `<Space>dV` | [DAP] step back |
| `<Space>dv` | [DAP] step over <F10> |
| `<Space>dx` | [DAP] set set_exception_breakpoints |
| `<Space>dyf` | [DAP-python] test_class |
| `<Space>dyr` | [DAP-python] test_method |
| `<Space>f,` | [diffchar] JumpDiffCharPrevStart |
| `<Space>f.` | [diffchar] JumpDiffCharNextStart |
| `<Space>f<lt>` | [diffchar] JumpDiffCharPrevEnd |
| `<Space>f>` | [diffchar] JumpDiffCharNextEnd |
| `<Space>fg` | [diffchar] GetDiffCharPair |
| `<Space>fO` | [spotdiff] VDiffoff! |
| `<Space>fo` | [spotdiff] VDiffoff |
| `<Space>fp` | [diffchar] PutDiffCharPair |
| `<Space>fr` | [spotdiff] refresh |
| `<Space>fT` | [spotdiff] VDiffthis! (separated) |
| `<Space>ft` | [spotdiff] VDiffthis |
| `<Space>gf` | [grug-far] find and replace |
| `<Space>gv` | [grug-far] find-and-replace within visual selection |
| `<Space>I` | [vim-illuminate] toggle visibility |
| `<Space>mm` | [multicursor] toggle cursor |
| `<Space>mN` | [multicursor] match back add cursor |
| `<Space>mn` | [multicursor] match add cursor |
| `<Space>mS` | [multicursor] match back skip cursor |
| `<Space>ms` | [multicursor] match skipcursor |
| `<Space>N` | toggle code Navigator |
| `<Space>t` | [Flash] Treesitter |
| `<Space>xa` | [hex] assemble |
| `<Space>xd` | [hex] dump |
| `<Space>xx` | [hex] toggle |
| `%` | <Plug>(MatchitNormalForward) |
| `&` | :help &-default |
| `<C-1>` | <Cmd>tabfirst<CR> |
| `<C-2>` | <Cmd>tabprevious<CR> |
| `<C-3>` | <Cmd>tabnext<CR> |
| `<C-4>` | <Cmd>tablast<CR> |
| `<C-Down>` | [multicursor] skip cursor and move down |
| `<C-L>` | :help CTRL-L-default |
| `<C-S-F5>` | [DAP] restart |
| `<C-S-Q>` | Lua Function |
| `<C-S-Tab>` | <Cmd>bp<CR> |
| `<C-S>` | Flash Search the word under cursor |
| `<C-Tab>` | <Cmd>bn<CR> |
| `<C-Up>` | [multicursor] skip cursor and move up |
| `<C-W> ` | show menu |
| `<C-W><C-D>` | Show diagnostics under the cursor |
| `<C-W><C-F>` | open file under cursor into vsplit window |
| `<C-W><C-H>` | continuous resize narrower |
| `<C-W><C-J>` | continuous resize shorter |
| `<C-W><C-K>` | continuous resize higher |
| `<C-W><C-L>` | continuous resize wider |
| `<C-W><S-Down>` | continuous move step down |
| `<C-W><S-Left>` | continuous move step left |
| `<C-W><S-Right>` | continuous move step right |
| `<C-W><S-Up>` | continuous move step up |
| `<C-W>d` | Show diagnostics under the cursor |
| `<F10>` | [DAP] step over |
| `<F11>` | [DAP] step into |
| `<F13>` | which-key top menu |
| `<F1>` | Lua Function |
| `<F4>` | [DAP-ui] select float |
| `<F5>` | [DAP] Start/Continue |
| `<F9>` | [DAP] toggle breakpoint |
| `<Plug>(Hydra1_wait)` | Lua Function |
| `<Plug>(Hydra1_wait)<Esc>` | Lua Function |
| `<Plug>(Hydra1_wait)H` | Lua Function |
| `<Plug>(Hydra1_wait)h` | Lua Function |
| `<Plug>(Hydra1_wait)L` | half screen ←/→ |
| `<Plug>(Hydra1_wait)l` | ←/→ |
| `<Plug>(Hydra2_wait)` | Lua Function |
| `<Plug>(Hydra2_wait)2` | ts=sw=2 |
| `<Plug>(Hydra2_wait)3` | ts=sw=3 |
| `<Plug>(Hydra2_wait)4` | ts=sw=4 |
| `<Plug>(Hydra2_wait)8` | ts=sw=8 |
| `<Plug>(Hydra2_wait)<CR>` | Lua Function |
| `<Plug>(Hydra2_wait)<Esc>` | Lua Function |
| `<Plug>(Hydra2_wait)C` | ft=csv |
| `<Plug>(Hydra2_wait)c` | cursor column |
| `<Plug>(Hydra2_wait)D` | diff |
| `<Plug>(Hydra2_wait)d` | DiffWhiteSpace |
| `<Plug>(Hydra2_wait)H` | hlsearch |
| `<Plug>(Hydra2_wait)I` | ignorecase |
| `<Plug>(Hydra2_wait)i` | show invisible |
| `<Plug>(Hydra2_wait)l` | cursor line |
| `<Plug>(Hydra2_wait)M` | modifiable |
| `<Plug>(Hydra2_wait)m` | ft=terminal |
| `<Plug>(Hydra2_wait)N` | ft= |
| `<Plug>(Hydra2_wait)n` | number |
| `<Plug>(Hydra2_wait)p` | paste |
| `<Plug>(Hydra2_wait)r` | relativenumber |
| `<Plug>(Hydra2_wait)s` | spell |
| `<Plug>(Hydra2_wait)t` | expandtab |
| `<Plug>(Hydra2_wait)u` | fileencoding=utf8 |
| `<Plug>(Hydra2_wait)v` | virtualedit |
| `<Plug>(Hydra2_wait)w` | wrap |
| `<Plug>(Hydra2_wait)x` | ft=text |
| `<Plug>(Hydra3_wait)` | Lua Function |
| `<Plug>(Hydra3_wait)2` | ts=sw=2 |
| `<Plug>(Hydra3_wait)3` | ts=sw=3 |
| `<Plug>(Hydra3_wait)4` | ts=sw=4 |
| `<Plug>(Hydra3_wait)8` | ts=sw=8 |
| `<Plug>(Hydra3_wait)<CR>` | Lua Function |
| `<Plug>(Hydra3_wait)<Esc>` | Lua Function |
| `<Plug>(Hydra3_wait)C` | ft=csv |
| `<Plug>(Hydra3_wait)c` | cursor column |
| `<Plug>(Hydra3_wait)D` | diff |
| `<Plug>(Hydra3_wait)d` | DiffWhiteSpace |
| `<Plug>(Hydra3_wait)H` | hlsearch |
| `<Plug>(Hydra3_wait)I` | ignore case |
| `<Plug>(Hydra3_wait)i` | show invisible |
| `<Plug>(Hydra3_wait)l` | cursor line |
| `<Plug>(Hydra3_wait)M` | modifiable |
| `<Plug>(Hydra3_wait)m` | ft=terminal |
| `<Plug>(Hydra3_wait)N` | ft= |
| `<Plug>(Hydra3_wait)n` | number |
| `<Plug>(Hydra3_wait)p` | paste |
| `<Plug>(Hydra3_wait)r` | relativenumber |
| `<Plug>(Hydra3_wait)s` | spell |
| `<Plug>(Hydra3_wait)t` | expandtab |
| `<Plug>(Hydra3_wait)u` | fileencoding=utf8 |
| `<Plug>(Hydra3_wait)v` | virtual edit |
| `<Plug>(Hydra3_wait)w` | wrap |
| `<Plug>(Hydra3_wait)x` | ft=text |
| `<Plug>(Hydra4_wait)` | Lua Function |
| `<Plug>(Hydra4_wait)$` | trim file's trailing \s* |
| `<Plug>(Hydra4_wait).` | replace . with space |
| `<Plug>(Hydra4_wait)<CR>` | close |
| `<Plug>(Hydra4_wait)<Esc>` | close |
| `<Plug>(Hydra4_wait)A` | :AerialNavToggle |
| `<Plug>(Hydra4_wait)a` | :AerialToggle! |
| `<Plug>(Hydra4_wait)d` | :DataViewer |
| `<Plug>(Hydra4_wait)L` | :Lazy |
| `<Plug>(Hydra4_wait)M` | :Mason |
| `<Plug>(Hydra4_wait)t` | :terminal |
| `<Plug>(Hydra5_wait)` | Lua Function |
| `<Plug>(Hydra5_wait) ` | show menu |
| `<Plug>(Hydra5_wait)<C-H>` | continuous resize narrower |
| `<Plug>(Hydra5_wait)<C-J>` | continuous resize shorter |
| `<Plug>(Hydra5_wait)<C-K>` | continuous resize higher |
| `<Plug>(Hydra5_wait)<C-L>` | continuous resize wider |
| `<Plug>(Hydra5_wait)<Down>` | move step down |
| `<Plug>(Hydra5_wait)<Esc>` | close menu |
| `<Plug>(Hydra5_wait)<Left>` | move step left |
| `<Plug>(Hydra5_wait)<Right>` | move step right |
| `<Plug>(Hydra5_wait)<S-Down>` | continuous move step down |
| `<Plug>(Hydra5_wait)<S-Left>` | continuous move step left |
| `<Plug>(Hydra5_wait)<S-Right>` | continuous move step right |
| `<Plug>(Hydra5_wait)<S-Up>` | continuous move step up |
| `<Plug>(Hydra5_wait)<Up>` | move step up |
| `<Plug>(MatchitNormalBackward)` | :<C-U>call matchit#Match_wrapper('',0,'n')<CR> |
| `<Plug>(MatchitNormalForward)` | :<C-U>call matchit#Match_wrapper('',1,'n')<CR> |
| `<Plug>(MatchitNormalMultiBackward)` | :<C-U>call matchit#MultiMatch("bW", "n")<CR> |
| `<Plug>(MatchitNormalMultiForward)` | :<C-U>call matchit#MultiMatch("W",  "n")<CR> |
| `<Plug>luasnip-delete-check` | LuaSnip: Removes current snippet from jumplist |
| `<Plug>luasnip-expand-repeat` | LuaSnip: Repeat last node expansion |
| `<S-Down>` | [multicursor] add cursor and move down |
| `<S-F11>` | [DAP] step out |
| `<S-F1>` | which-key top menu |
| `<S-F5>` | [DAP] terminate |
| `<S-Up>` | [multicursor] add cursor and move up |
| `[ ` | Add empty line above cursor |
| `[%` | <Plug>(MatchitNormalMultiBackward) |
| `[<C-L>` | :lpfile |
| `[<C-Q>` | :cpfile |
| `[<C-T>` | :ptprevious |
| `[A` | :rewind |
| `[a` | :previous |
| `[B` | :brewind |
| `[b` | :bprevious |
| `[D` | Jump to the first diagnostic in the current buffer |
| `[d` | Jump to the previous diagnostic in the current buffer |
| `[L` | :lrewind |
| `[l` | :lprevious |
| `[Q` | :crewind |
| `[q` | :cprevious |
| `[T` | :trewind |
| `[t` | :tprevious |
| `\ ` | open system menu |
| `\:l` | lcd to launching folder |
| `\<C-K>` | CCC color picker |
| `\<S-Tab>` | Fold-cycle: close folds |
| `\<Tab>` | Fold-cycle: open folds |
| `\\` | Oil explorer: open current folder in the same window |
| `\a` | Actions |
| `\B:` | [Bookmarks] Command |
| `\BA` | [Bookmarks] reAttach to root node |
| `\Ba` | [Bookmarks] add description |
| `\bb` | <Cmd>new<CR> |
| `\Bd` | [Bookmarks] delete marks in current file |
| `\bD` | <Cmd>bd!<CR> |
| `\bd` | <Cmd>bd<CR> |
| `\BG` | [Bookmarks] Grep through bookmarked files |
| `\Bg` | [Bookmarks] Go to (select) |
| `\BI` | [Bookmarks] plugin current Info |
| `\Bi` | [Bookmarks] current bookmark Info |
| `\Bl<CR>` | [Bookmarks] pick a List |
| `\Blf` | [Bookmarks] current File bookmarks to new list |
| `\BLi` | [Bookmarks] goto Linked in bookmarks |
| `\BLl` | [Bookmarks] Link bookmark |
| `\BLm` | [Bookmarks] mark and link to existing bookmark |
| `\Bln` | [Bookmarks] create a New list |
| `\BLo` | [Bookmarks] goto Linked out bookmarks |
| `\Bm` | [Bookmarks] Mark/toggle current line |
| `\BN` | [Bookmarks] Go to next (by id) |
| `\Bn` | [Bookmarks] Go to next (by line number) |
| `\bn` | <Cmd>bn<CR> |
| `\BP` | [Bookmarks] Go to previous (by id) |
| `\Bp` | [Bookmarks] Go to previous (by line number) |
| `\bp` | <Cmd>bp<CR> |
| `\BT` | [Bookmarks] Tree view |
| `\bv` | <Cmd>vnew<CR> |
| `\BX` | [Bookmarks] miX active bookmark into XML |
| `\cE` | edit nvim main config (netrw) |
| `\ce` | edit nvim main config (oil) |
| `\cr` | reload nvim main config |
| `\D` | Open CSV/sqlite viewer |
| `\e3` | Oil explorer: open current folder on the top |
| `\ed` | Oil explorer: open current folder on the bottom |
| `\ee` | Oil explorer: open current folder in the same window |
| `\ef` | Oil explorer: open current folder float |
| `\en` | netrw Explore . |
| `\er` | Oil explorer: open current folder on the right) |
| `\ew` | Oil explorer: open current folder on the left |
| `\fa` | [Telescope] aerial |
| `\fb` | [Telescope] buffers |
| `\ff` | [Telescope] find_files |
| `\fg` | [Telescope] live_grep |
| `\fh` | [Telescope] help_tags |
| `\Fp` | copy full filepath to clipboard |
| `\Ft0` | <Cmd>set filetype=<CR> |
| `\Ftc` | <Cmd>set filetype=csv<CR> |
| `\Gb` | Gitsigns blame_line |
| `\Gcn` | Gitsigns jump to next change |
| `\Gcp` | Gitsigns jump to previous change |
| `\GD` | Gitsigns diffthis("~") |
| `\Gd` | Gitsigns diffthis |
| `\Gp` | Gitsigns preview_hunk |
| `\GR` | Gitsigns reset_ |
| `\Gr` | Gitsigns reset_hunk |
| `\GS` | Gitsigns stage_buffer |
| `\Gs` | Gitsigns stage_hunk |
| `\Gtb` | Gitsigns toggle_current_line_blame |
| `\Gtd` | Gitsigns toggle_deleted |
| `\Gu` | Gitsigns undo stage_buffer |
| `\i` | toggle outlIne |
| `\lc` | code_action |
| `\lD` | Declaration |
| `\ld` | definition |
| `\lF` | built-in formatter |
| `\lf` | format file or range |
| `\lgf` | open float |
| `\lgw` | setloclist |
| `\lh` | hover/help |
| `\li` | implementation |
| `\Ln` | line number: toggle |
| `\Lr` | line number: relative toggle |
| `\lR` | refactor/rename |
| `\lr` | references |
| `\lt` | type definition |
| `\Lw` | line wrap: toggle |
| `\lzc` | Lua Function |
| `\lzD` | Lua Function |
| `\lzd` | Lua Function |
| `\lzf` | Lua Function |
| `\lzgd` | Lua Function |
| `\lzgw` | Lua Function |
| `\lzI` | Lua Function |
| `\lzi` | Lua Function |
| `\lzO` | Lua Function |
| `\lzr` | Lua Function |
| `\lzsd` | Lua Function |
| `\lzsl` | Lua Function |
| `\lzsw` | Lua Function |
| `\lzt` | Lua Function |
| `\M1` | open system menu |
| `\M2` | open development menu |
| `\O` | Options2 |
| `\o` | Options |
| `\P` | paste before from clipboard (reg +) |
| `\p` | Paste after from clipboard (reg +) |
| `\sa` | [reSession save as] |
| `\sD` | [reSession Detach current] |
| `\sd` | [reSession delete] |
| `\sl` | [reSession load] |
| `\sP` | "*P |
| `\sp` | "*p |
| `\ss` | [reSession save] |
| `\st` | [reSession save_tab] |
| `\t1` | <Cmd>tabfirst<CR> |
| `\t9` | <Cmd>tablast<CR> |
| `\tc` | <Cmd>tabclose<CR> |
| `\tn` | <Cmd>tabnext<CR> |
| `\to` | <Cmd>tabonly<CR> |
| `\TP` | tome: play current paragraph |
| `\Tp` | tome: play current line |
| `\tp` | <Cmd>tabprevious<CR> |
| `\ts` | split current window into a new tab |
| `\tt` | <Cmd>tabnew<CR> |
| `\u` | Telescope Undo |
| `\w` | <Cmd>:w<CR> |
| `\z/` | Lua Function |
| `\za` | Lua Function |
| `\zB` | Lua Function |
| `\zb` | Lua Function |
| `\zC` | Lua Function |
| `\zc` | Lua Function |
| `\zf` | Lua Function |
| `\zg` | Lua Function |
| `\zH` | Lua Function |
| `\zj` | Lua Function |
| `\zK` | Lua Function |
| `\zl` | Lua Function |
| `\zm` | Lua Function |
| `\zo` | Lua Function |
| `\zQ` | Lua Function |
| `\zq` | Lua Function |
| `\zr` | Lua Function |
| `\zt` | Lua Function |
| `\zZ` | Lua Function |
| `\zz` | Lua Function |
| `] ` | Add empty line below cursor |
| `]%` | <Plug>(MatchitNormalMultiForward) |
| `]<C-L>` | :lnfile |
| `]<C-Q>` | :cnfile |
| `]<C-T>` | :ptnext |
| `]A` | :last |
| `]a` | :next |
| `]B` | :blast |
| `]b` | :bnext |
| `]D` | Jump to the last diagnostic in the current buffer |
| `]d` | Jump to the next diagnostic in the current buffer |
| `]L` | :llast |
| `]l` | :lnext |
| `]Q` | :clast |
| `]q` | :cnext |
| `]T` | :tlast |
| `]t` | :tnext |
| `g%` | <Plug>(MatchitNormalBackward) |
| `gc` | Toggle comment |
| `gcc` | Toggle comment line |
| `gO` | vim.lsp.buf.document_symbol() |
| `gra` | vim.lsp.buf.code_action() |
| `gri` | vim.lsp.buf.implementation() |
| `grn` | vim.lsp.buf.rename() |
| `grr` | vim.lsp.buf.references() |
| `grt` | vim.lsp.buf.type_definition() |
| `grx` | vim.lsp.codelens.run() |
| `gx` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |
| `m ` | [Bookmarks] Mark current line. |
| `m<CR>` | [Bookmarks] Go to (select) |
| `m<Del>` | delete marks of current file |
| `m<Down>` | [Bookmarks] Go to next (by line number) |
| `m<S-Down>` | [Bookmarks] Go to next (by id) |
| `m<S-Up>` | [Bookmarks] Go to previous (by id) |
| `m<Up>` | [Bookmarks] Go to previous (by line number) |
| `m\` | [Bookmarks] command |
| `Y` | :help Y-default |
| `zC` | Fold-cycle: close all folds under cursor |
| `zH` | Lua Function |
| `zh` | Lua Function |
| `zL` | half screen ←/→ |
| `zl` | ←/→ |
| `zM` | ufo (fold) close all |
| `zP` | ufo (fold): preview |
| `zR` | ufo (fold): open all |

## Command Mode

| Key | Action / Description |
|-----|----------------------|
| `<C-S>` | [Flash] Toggle Flash during / ? search |
| `<F13>` | which-key top menu |
| `<F1>` | Lua Function |
| `<Plug>luasnip-delete-check` | LuaSnip: Removes current snippet from jumplist |
| `<Plug>luasnip-expand-repeat` | LuaSnip: Repeat last node expansion |
| `<S-F1>` | which-key top menu |

## Visual Mode

| Key | Action / Description |
|-----|----------------------|
| `<Space>/` | [Flash] search (wrap) |
| `<Space>dh` | [DAP] hover |
| `<Space>dp` | [DAP] preview |
| `<Space>dys` | [DAP-python] debug_selection test_class |
| `<Space>gf` | [grug-far] find and replace |
| `<Space>gv` | [grug-far] find-and-replace within visual selection |
| `<Space>mm` | [multicursor] toggle cursor |
| `<Space>mN` | [multicursor] match back add cursor |
| `<Space>mn` | [multicursor] match add cursor |
| `<Space>mS` | [multicursor] match back skip cursor |
| `<Space>ms` | [multicursor] match skipcursor |
| `<Space>t` | [Flash] Treesitter |
| `<Space>xa` | [hex] assemble |
| `<Space>xd` | [hex] dump |
| `<Space>xx` | [hex] toggle |
| `!` | diagnostic textobj |
| `#` | :help v_#-default |
| `%` | <Plug>(MatchitVisualForward) |
| `*` | :help v_star-default |
| `.` | emoji textobj |
| `<C-Down>` | [multicursor] skip cursor and move down |
| `<C-J>` | jump previous |
| `<C-L>` | jump next |
| `<C-S-F5>` | [DAP] restart |
| `<C-S>` | [Flash] Treesitter search |
| `<C-S>` | vim.lsp.buf.signature_help() |
| `<C-Up>` | [multicursor] skip cursor and move up |
| `<F10>` | [DAP] step over |
| `<F11>` | [DAP] step into |
| `<F13>` | which-key top menu |
| `<F1>` | Lua Function |
| `<F5>` | [DAP] Start/Continue |
| `<F9>` | [DAP] toggle breakpoint |
| `<Plug>(ccc-select-color)` | Lua Function |
| `<Plug>(Hydra2_wait)` | Lua Function |
| `<Plug>(Hydra2_wait)2` | ts=sw=2 |
| `<Plug>(Hydra2_wait)3` | ts=sw=3 |
| `<Plug>(Hydra2_wait)4` | ts=sw=4 |
| `<Plug>(Hydra2_wait)8` | ts=sw=8 |
| `<Plug>(Hydra2_wait)<CR>` | Lua Function |
| `<Plug>(Hydra2_wait)<Esc>` | Lua Function |
| `<Plug>(Hydra2_wait)C` | ft=csv |
| `<Plug>(Hydra2_wait)c` | cursor column |
| `<Plug>(Hydra2_wait)D` | diff |
| `<Plug>(Hydra2_wait)d` | DiffWhiteSpace |
| `<Plug>(Hydra2_wait)H` | hlsearch |
| `<Plug>(Hydra2_wait)I` | ignorecase |
| `<Plug>(Hydra2_wait)i` | show invisible |
| `<Plug>(Hydra2_wait)l` | cursor line |
| `<Plug>(Hydra2_wait)M` | modifiable |
| `<Plug>(Hydra2_wait)m` | ft=terminal |
| `<Plug>(Hydra2_wait)N` | ft= |
| `<Plug>(Hydra2_wait)n` | number |
| `<Plug>(Hydra2_wait)p` | paste |
| `<Plug>(Hydra2_wait)r` | relativenumber |
| `<Plug>(Hydra2_wait)s` | spell |
| `<Plug>(Hydra2_wait)t` | expandtab |
| `<Plug>(Hydra2_wait)u` | fileencoding=utf8 |
| `<Plug>(Hydra2_wait)v` | virtualedit |
| `<Plug>(Hydra2_wait)w` | wrap |
| `<Plug>(Hydra2_wait)x` | ft=text |
| `<Plug>(Hydra3_wait)` | Lua Function |
| `<Plug>(Hydra3_wait)2` | ts=sw=2 |
| `<Plug>(Hydra3_wait)3` | ts=sw=3 |
| `<Plug>(Hydra3_wait)4` | ts=sw=4 |
| `<Plug>(Hydra3_wait)8` | ts=sw=8 |
| `<Plug>(Hydra3_wait)<CR>` | Lua Function |
| `<Plug>(Hydra3_wait)<Esc>` | Lua Function |
| `<Plug>(Hydra3_wait)C` | ft=csv |
| `<Plug>(Hydra3_wait)c` | cursor column |
| `<Plug>(Hydra3_wait)D` | diff |
| `<Plug>(Hydra3_wait)d` | DiffWhiteSpace |
| `<Plug>(Hydra3_wait)H` | hlsearch |
| `<Plug>(Hydra3_wait)I` | ignore case |
| `<Plug>(Hydra3_wait)i` | show invisible |
| `<Plug>(Hydra3_wait)l` | cursor line |
| `<Plug>(Hydra3_wait)M` | modifiable |
| `<Plug>(Hydra3_wait)m` | ft=terminal |
| `<Plug>(Hydra3_wait)N` | ft= |
| `<Plug>(Hydra3_wait)n` | number |
| `<Plug>(Hydra3_wait)p` | paste |
| `<Plug>(Hydra3_wait)r` | relativenumber |
| `<Plug>(Hydra3_wait)s` | spell |
| `<Plug>(Hydra3_wait)t` | expandtab |
| `<Plug>(Hydra3_wait)u` | fileencoding=utf8 |
| `<Plug>(Hydra3_wait)v` | virtual edit |
| `<Plug>(Hydra3_wait)w` | wrap |
| `<Plug>(Hydra3_wait)x` | ft=text |
| `<Plug>(Hydra4_wait)` | Lua Function |
| `<Plug>(Hydra4_wait)$` | trim file's trailing \s* |
| `<Plug>(Hydra4_wait).` | replace . with space |
| `<Plug>(Hydra4_wait)<CR>` | close |
| `<Plug>(Hydra4_wait)<Esc>` | close |
| `<Plug>(Hydra4_wait)A` | :AerialNavToggle |
| `<Plug>(Hydra4_wait)a` | :AerialToggle! |
| `<Plug>(Hydra4_wait)d` | :DataViewer |
| `<Plug>(Hydra4_wait)L` | :Lazy |
| `<Plug>(Hydra4_wait)M` | :Mason |
| `<Plug>(Hydra4_wait)t` | :terminal |
| `<Plug>(MatchitVisualBackward)` | :<C-U>call matchit#Match_wrapper('',0,'v')<CR>m'gv`` |
| `<Plug>(MatchitVisualForward)` | :<C-U>call matchit#Match_wrapper('',1,'v')<CR>:if col("''") != col("$") \| exe ":normal! m'" \| endif<CR>gv`` |
| `<Plug>(MatchitVisualMultiBackward)` | :<C-U>call matchit#MultiMatch("bW", "n")<CR>m'gv`` |
| `<Plug>(MatchitVisualMultiForward)` | :<C-U>call matchit#MultiMatch("W",  "n")<CR>m'gv`` |
| `<Plug>(MatchitVisualTextObject)` | <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward) |
| `<Plug>luasnip-expand-or-jump` | LuaSnip: Expand or jump in the current snippet |
| `<Plug>luasnip-expand-repeat` | LuaSnip: Repeat last node expansion |
| `<Plug>luasnip-expand-snippet` | LuaSnip: Expand the current snippet |
| `<Plug>luasnip-jump-next` | LuaSnip: Jump to the next node |
| `<Plug>luasnip-jump-prev` | LuaSnip: Jump to the previous node |
| `<Plug>luasnip-next-choice` | LuaSnip: Change to the next choice from the choiceNode |
| `<Plug>luasnip-prev-choice` | LuaSnip: Change to the previous choice from the choiceNode |
| `<S-Down>` | [multicursor] add cursor and move down |
| `<S-F11>` | [DAP] step out |
| `<S-F1>` | which-key top menu |
| `<S-F5>` | [DAP] terminate |
| `<S-Tab>` | vim.snippet.jump if active, otherwise <S-Tab> |
| `<S-Up>` | [multicursor] add cursor and move up |
| `<Tab>` | vim.snippet.jump if active, otherwise <Tab> |
| `@` | :help v_@-default |
| `[%` | <Plug>(MatchitVisualMultiBackward) |
| `[N` | Select previous sibling node |
| `[n` | Select previous node |
| `\a` | Actions |
| `\B:` | [Bookmarks] Command |
| `\BA` | [Bookmarks] reAttach to root node |
| `\Ba` | [Bookmarks] add description |
| `\Bd` | [Bookmarks] delete marks in current file |
| `\BG` | [Bookmarks] Grep through bookmarked files |
| `\Bg` | [Bookmarks] Go to (select) |
| `\BI` | [Bookmarks] plugin current Info |
| `\Bi` | [Bookmarks] current bookmark Info |
| `\Bl<CR>` | [Bookmarks] pick a List |
| `\Blf` | [Bookmarks] current File bookmarks to new list |
| `\BLi` | [Bookmarks] goto Linked in bookmarks |
| `\BLl` | [Bookmarks] Link bookmark |
| `\BLm` | [Bookmarks] mark and link to existing bookmark |
| `\Bln` | [Bookmarks] create a New list |
| `\BLo` | [Bookmarks] goto Linked out bookmarks |
| `\Bm` | [Bookmarks] Mark/toggle current line |
| `\BN` | [Bookmarks] Go to next (by id) |
| `\Bn` | [Bookmarks] Go to next (by line number) |
| `\BP` | [Bookmarks] Go to previous (by id) |
| `\Bp` | [Bookmarks] Go to previous (by line number) |
| `\BT` | [Bookmarks] Tree view |
| `\BX` | [Bookmarks] miX active bookmark into XML |
| `\Gr` | Gitsigns reset_hunk |
| `\Gs` | Gitsigns stage_hunk |
| `\lf` | format file or range |
| `\O` | Options2 |
| `\o` | Options |
| `\P` | paste before from clipboard (reg +) |
| `\p` | Paste after from clipboard (reg +) |
| `\sP` | "*P |
| `\sp` | "*p |
| `\sy` | "*y |
| `\Tp` | tome: play selection |
| `\y` | copy to clipboard (reg +) |
| `]%` | <Plug>(MatchitVisualMultiForward) |
| `]N` | Select next sibling node |
| `]n` | Select next node |
| `a#` | outer color textobj |
| `a%` | <Plug>(MatchitVisualTextObject) |
| `a,` | outer argument textobj |
| `a_` | outer lineCharacterwise textobj |
| `aD` | outer doubleSquareBrackets textobj |
| `aF` | outer filepath textobj |
| `ag` | outer greedyOuterIndentation textobj |
| `aI` | outer-outer indentation textobj |
| `ai` | outer-inner indentation textobj |
| `ak` | outer key textobj |
| `aN` | outer notebookCell textobj |
| `an` | outer number textobj |
| `ao` | outer anyBracket textobj |
| `aq` | outer anyQuote textobj |
| `aS` | outer subword textobj |
| `av` | outer value textobj |
| `az` | outer closedFold textobj |
| `C` | toNextClosingBracket textobj |
| `g%` | <Plug>(MatchitVisualBackward) |
| `g;` | lastChange textobj |
| `gc` | Toggle comment |
| `gG` | entireBuffer textobj |
| `gra` | vim.lsp.buf.code_action() |
| `gW` | restOfWindow textobj |
| `gw` | visibleInWindow textobj |
| `gx` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |
| `i#` | inner color textobj |
| `i,` | inner argument textobj |
| `i_` | inner lineCharacterwise textobj |
| `iD` | inner doubleSquareBrackets textobj |
| `iF` | inner filepath textobj |
| `ig` | inner greedyOuterIndentation textobj |
| `ih` | Gitsigns select_hunk |
| `iI` | inner-inner indentation textobj |
| `ii` | inner-inner indentation textobj |
| `ik` | inner key textobj |
| `iN` | inner notebookCell textobj |
| `in` | inner number textobj |
| `io` | inner anyBracket textobj |
| `iq` | inner anyQuote textobj |
| `iS` | inner subword textobj |
| `iv` | inner value textobj |
| `iz` | inner closedFold textobj |
| `m ` | [Bookmarks] Mark current line. |
| `m<CR>` | [Bookmarks] Go to (select) |
| `m<Del>` | delete marks of current file |
| `m<Down>` | [Bookmarks] Go to next (by line number) |
| `m<S-Down>` | [Bookmarks] Go to next (by id) |
| `m<S-Up>` | [Bookmarks] Go to previous (by id) |
| `m<Up>` | [Bookmarks] Go to previous (by line number) |
| `m\` | [Bookmarks] command |
| `n` | nearEoL textobj |
| `Q` | toNextQuotationMark textobj |
| `R` | restOfIndentation textobj |
| `\|` | column textobj |

## Insert Mode

| Key | Action / Description |
|-----|----------------------|
| `<C-J>` | jump previous |
| `<C-K>` | expand snip |
| `<C-L>` | jump next |
| `<C-S-F5>` | [DAP] restart |
| `<C-S>` | vim.lsp.buf.signature_help() |
| `<C-U>` | :help i_CTRL-U-default |
| `<C-W>` | :help i_CTRL-W-default |
| `<F10>` | [DAP] step over |
| `<F11>` | [DAP] step into |
| `<F13>` | which-key top menu |
| `<F1>` | Lua Function |
| `<F5>` | [DAP] Start/Continue |
| `<F9>` | [DAP] toggle breakpoint |
| `<Plug>(ccc-insert)` | Lua Function |
| `<Plug>luasnip-delete-check` | LuaSnip: Removes current snippet from jumplist |
| `<Plug>luasnip-expand-or-jump` | LuaSnip: Expand or jump in the current snippet |
| `<Plug>luasnip-expand-repeat` | LuaSnip: Repeat last node expansion |
| `<Plug>luasnip-expand-snippet` | LuaSnip: Expand the current snippet |
| `<Plug>luasnip-jump-next` | LuaSnip: Jump to the next node |
| `<Plug>luasnip-jump-prev` | LuaSnip: Jump to the previous node |
| `<Plug>luasnip-next-choice` | LuaSnip: Change to the next choice from the choiceNode |
| `<Plug>luasnip-prev-choice` | LuaSnip: Change to the previous choice from the choiceNode |
| `<S-F11>` | [DAP] step out |
| `<S-F1>` | which-key top menu |
| `<S-F5>` | [DAP] terminate |
| `<S-Tab>` | vim.snippet.jump if active, otherwise <S-Tab> |
| `<Tab>` | vim.snippet.jump if active, otherwise <Tab> |

