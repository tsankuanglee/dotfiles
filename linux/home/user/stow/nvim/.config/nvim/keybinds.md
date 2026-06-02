# Neovim Keybindings

## Normal Mode

| Key | Action / Description |
|-----|----------------------|
| `<Space>N` | toggle code Navigator |
| `<Space>t` | [Flash] Treesitter |
| `<Space>/` | [Flash] search (wrap) |
| `<Space>gv` | [grug-far] find-and-replace within visual selection |
| `<Space>gf` | [grug-far] find and replace |
| `<Space>I` | [vim-illuminate] toggle visibility |
| `<Space>xd` | [hex] dump |
| `<Space>xx` | [hex] toggle |
| `<Space>xa` | [hex] assemble |
| `<Space>mm` | [multicursor] toggle cursor |
| `<Space>mS` | [multicursor] match back skip cursor |
| `<Space>mN` | [multicursor] match back add cursor |
| `<Space>ms` | [multicursor] match skipcursor |
| `<Space>mn` | [multicursor] match add cursor |
| `<Space>C` | Colorize ANSI text |
| `<Space>ft` | [spotdiff] VDiffthis |
| `<Space>fr` | [spotdiff] refresh |
| `<Space>fO` | [spotdiff] VDiffoff! |
| `<Space>fo` | [spotdiff] VDiffoff |
| `<Space>fT` | [spotdiff] VDiffthis! (separated) |
| `<Space>fp` | [diffchar] PutDiffCharPair |
| `<Space>fg` | [diffchar] GetDiffCharPair |
| `<Space>f>` | [diffchar] JumpDiffCharNextEnd |
| `<Space>f<lt>` | [diffchar] JumpDiffCharPrevEnd |
| `<Space>f.` | [diffchar] JumpDiffCharNextStart |
| `<Space>f,` | [diffchar] JumpDiffCharPrevStart |
| `<Space>drs` | [DAP] restart |
| `<Space>dq` | [DAP] terminate |
| `<Space>dc` | [DAP] Start/Continue <F5> |
| `<Space>dC` | [DAP] close session |
| `<Space>dD` | [DAP] disconnect from debuggee |
| `<Space>ds` | [DAP] scopes |
| `<Space>df` | [DAP] frames |
| `<Space>dp` | [DAP] preview |
| `<Space>dh` | [DAP] hover |
| `<Space>dE` | [DAP] toggle REPL |
| `<Space>dl` | [DAP] Log Point |
| `<Space>dx` | [DAP] set set_exception_breakpoints |
| `<Space>dT` | [DAP] clear breakpoints |
| `<Space>dt` | [DAP] list breakpoints |
| `<Space>dB` | [DAP] set breakpoint |
| `<Space>db` | [DAP] toggle breakpoint (also <F9>) |
| `<Space>d<Down>` | [DAP] go doen stacktrace |
| `<Space>d<Up>` | [DAP] go up stacktrace |
| `<Space>dV` | [DAP] step back |
| `<Space>do` | [DAP] step out <S-F11> |
| `<Space>di` | [DAP] step into <F11> |
| `<Space>dv` | [DAP] step over <F10> |
| `<Space>drl` | [DAP] run last |
| `<Space>drn` | [DAP] run (debug test cases) |
| `<Space>drc` | [DAP] run to cursor |
| `<Space>dyr` | [DAP-python] test_method |
| `<Space>dyf` | [DAP-python] test_class |
| `<Space>de` | [DAP-ui] eval cursor/visual |
| `<Space>dF` | [DAP-ui] select float |
| `<Space>dut` | [DAP-ui] toggle UI |
| `<Space>duc` | [DAP-ui] close UI |
| `<Space>dur` | [DAP-ui] open reset UI |
| `<Space>duo` | [DAP-ui] open UI |
| `%` | <Plug>(MatchitNormalForward) |
| `&` | :help &-default |
| `Y` | :help Y-default |
| `[%` | <Plug>(MatchitNormalMultiBackward) |
| `[ ` | Add empty line above cursor |
| `[B` | :brewind |
| `[b` | :bprevious |
| `[<C-T>` | :ptprevious |
| `[T` | :trewind |
| `[t` | :tprevious |
| `[A` | :rewind |
| `[a` | :previous |
| `[<C-L>` | :lpfile |
| `[L` | :lrewind |
| `[l` | :lprevious |
| `[<C-Q>` | :cpfile |
| `[Q` | :crewind |
| `[q` | :cprevious |
| `[D` | Jump to the first diagnostic in the current buffer |
| `[d` | Jump to the previous diagnostic in the current buffer |
| `\<C-K>` | CCC color picker |
| `\a` | Actions |
| `\O` | Options2 |
| `\o` | Options |
| `\lF` | built-in formatter |
| `\lc` | code_action |
| `\lR` | refactor/rename |
| `\lh` | hover/help |
| `\li` | implementation |
| `\lt` | type definition |
| `\lD` | Declaration |
| `\ld` | definition |
| `\lr` | references |
| `\lgw` | setloclist |
| `\lgf` | open float |
| `\Gtb` | Gitsigns toggle_current_line_blame |
| `\Gb` | Gitsigns blame_line |
| `\Gp` | Gitsigns preview_hunk |
| `\GR` | Gitsigns reset_ |
| `\Gu` | Gitsigns undo stage_buffer |
| `\GS` | Gitsigns stage_buffer |
| `\Gr` | Gitsigns reset_hunk |
| `\Gs` | Gitsigns stage_hunk |
| `\Gcp` | Gitsigns jump to previous change |
| `\Gcn` | Gitsigns jump to next change |
| `\Gtd` | Gitsigns toggle_deleted |
| `\GD` | Gitsigns diffthis("~") |
| `\Gd` | Gitsigns diffthis |
| `\ew` | Oil explorer: open current folder on the left |
| `\er` | Oil explorer: open current folder on the right) |
| `\\` | Oil explorer: open current folder in the same window |
| `\ee` | Oil explorer: open current folder in the same window |
| `\en` | netrw Explore . |
| `\ef` | Oil explorer: open current folder float |
| `\ed` | Oil explorer: open current folder on the bottom |
| `\e3` | Oil explorer: open current folder on the top |
| `\M2` | open development menu |
| `\M1` | open system menu |
| `\ ` | open system menu |
| `\<S-Tab>` | Fold-cycle: close folds |
| `\<Tab>` | Fold-cycle: open folds |
| `\fh` | [Telescope] help_tags |
| `\fb` | [Telescope] buffers |
| `\fg` | [Telescope] live_grep |
| `\ff` | [Telescope] find_files |
| `\fa` | [Telescope] aerial |
| `\i` | toggle outlIne |
| `\lzgw` | Lua Function |
| `\lzgd` | Lua Function |
| `\lzf` | Lua Function |
| `\lzO` | Lua Function |
| `\lzI` | Lua Function |
| `\lzc` | Lua Function |
| `\lzsl` | Lua Function |
| `\lzsw` | Lua Function |
| `\lzsd` | Lua Function |
| `\lzi` | Lua Function |
| `\lzt` | Lua Function |
| `\lzD` | Lua Function |
| `\lzd` | Lua Function |
| `\lzr` | Lua Function |
| `\zK` | Lua Function |
| `\zr` | Lua Function |
| `\zg` | Lua Function |
| `\z/` | Lua Function |
| `\zz` | Lua Function |
| `\zZ` | Lua Function |
| `\zm` | Lua Function |
| `\zH` | Lua Function |
| `\za` | Lua Function |
| `\zB` | Lua Function |
| `\zl` | Lua Function |
| `\zC` | Lua Function |
| `\zc` | Lua Function |
| `\zQ` | Lua Function |
| `\zq` | Lua Function |
| `\zj` | Lua Function |
| `\zt` | Lua Function |
| `\zb` | Lua Function |
| `\zo` | Lua Function |
| `\zf` | Lua Function |
| `\D` | Open CSV/sqlite viewer |
| `\TP` | tome: play current paragraph |
| `\Tp` | tome: play current line |
| `\sD` | [reSession Detach current] |
| `\sd` | [reSession delete] |
| `\sl` | [reSession load] |
| `\st` | [reSession save_tab] |
| `\sa` | [reSession save as] |
| `\ss` | [reSession save] |
| `\lf` | format file or range |
| `\Ba` | [Bookmarks] add description |
| `\BG` | [Bookmarks] Grep through bookmarked files |
| `\BLm` | [Bookmarks] mark and link to existing bookmark |
| `\BLi` | [Bookmarks] goto Linked in bookmarks |
| `\BLo` | [Bookmarks] goto Linked out bookmarks |
| `\BLl` | [Bookmarks] Link bookmark |
| `\BX` | [Bookmarks] miX active bookmark into XML |
| `\Blf` | [Bookmarks] current File bookmarks to new list |
| `\Bln` | [Bookmarks] create a New list |
| `\Bl<CR>` | [Bookmarks] pick a List |
| `\BT` | [Bookmarks] Tree view |
| `\BP` | [Bookmarks] Go to previous (by id) |
| `\BN` | [Bookmarks] Go to next (by id) |
| `\Bp` | [Bookmarks] Go to previous (by line number) |
| `\Bn` | [Bookmarks] Go to next (by line number) |
| `\Bg` | [Bookmarks] Go to (select) |
| `\BA` | [Bookmarks] reAttach to root node |
| `\Bd` | [Bookmarks] delete marks in current file |
| `\Bm` | [Bookmarks] Mark/toggle current line |
| `\B:` | [Bookmarks] Command |
| `\Bi` | [Bookmarks] current bookmark Info |
| `\BI` | [Bookmarks] plugin current Info |
| `\u` | Telescope Undo |
| `\:l` | lcd to launching folder |
| `\Lw` | line wrap: toggle |
| `\Ln` | line number: toggle |
| `\Lr` | line number: relative toggle |
| `\Ftc` | <Cmd>set filetype=csv<CR> |
| `\Ft0` | <Cmd>set filetype=<CR> |
| `\Fp` | copy full filepath to clipboard |
| `\t9` | <Cmd>tablast<CR> |
| `\t1` | <Cmd>tabfirst<CR> |
| `\tp` | <Cmd>tabprevious<CR> |
| `\tn` | <Cmd>tabnext<CR> |
| `\to` | <Cmd>tabonly<CR> |
| `\tc` | <Cmd>tabclose<CR> |
| `\tt` | <Cmd>tabnew<CR> |
| `\ts` | split current window into a new tab |
| `\bp` | <Cmd>bp<CR> |
| `\bn` | <Cmd>bn<CR> |
| `\bD` | <Cmd>bd!<CR> |
| `\bd` | <Cmd>bd<CR> |
| `\bv` | <Cmd>vnew<CR> |
| `\bb` | <Cmd>new<CR> |
| `\sP` | "*P |
| `\sp` | "*p |
| `\P` | paste before from clipboard (reg +) |
| `\p` | Paste after from clipboard (reg +) |
| `\w` | <Cmd>:w<CR> |
| `\cr` | reload nvim main config |
| `\cE` | edit nvim main config (netrw) |
| `\ce` | edit nvim main config (oil) |
| `]%` | <Plug>(MatchitNormalMultiForward) |
| `] ` | Add empty line below cursor |
| `]B` | :blast |
| `]b` | :bnext |
| `]<C-T>` | :ptnext |
| `]T` | :tlast |
| `]t` | :tnext |
| `]A` | :last |
| `]a` | :next |
| `]<C-L>` | :lnfile |
| `]L` | :llast |
| `]l` | :lnext |
| `]<C-Q>` | :cnfile |
| `]Q` | :clast |
| `]q` | :cnext |
| `]D` | Jump to the last diagnostic in the current buffer |
| `]d` | Jump to the next diagnostic in the current buffer |
| `g%` | <Plug>(MatchitNormalBackward) |
| `gO` | vim.lsp.buf.document_symbol() |
| `grt` | vim.lsp.buf.type_definition() |
| `gri` | vim.lsp.buf.implementation() |
| `grr` | vim.lsp.buf.references() |
| `grx` | vim.lsp.codelens.run() |
| `gra` | vim.lsp.buf.code_action() |
| `grn` | vim.lsp.buf.rename() |
| `gcc` | Toggle comment line |
| `gc` | Toggle comment |
| `gx` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |
| `m<S-Down>` | [Bookmarks] Go to next (by id) |
| `m<S-Up>` | [Bookmarks] Go to previous (by id) |
| `m<Down>` | [Bookmarks] Go to next (by line number) |
| `m<Up>` | [Bookmarks] Go to previous (by line number) |
| `m\` | [Bookmarks] command |
| `m<Del>` | delete marks of current file |
| `m<CR>` | [Bookmarks] Go to (select) |
| `m ` | [Bookmarks] Mark current line. |
| `zl` | ←/→ |
| `zL` | half screen ←/→ |
| `zh` | Lua Function |
| `zH` | Lua Function |
| `zC` | Fold-cycle: close all folds under cursor |
| `zP` | ufo (fold): preview |
| `zM` | ufo (fold) close all |
| `zR` | ufo (fold): open all |
| `<Plug>(MatchitNormalMultiForward)` | :<C-U>call matchit#MultiMatch("W",  "n")<CR> |
| `<Plug>(MatchitNormalMultiBackward)` | :<C-U>call matchit#MultiMatch("bW", "n")<CR> |
| `<Plug>(MatchitNormalBackward)` | :<C-U>call matchit#Match_wrapper('',0,'n')<CR> |
| `<Plug>(MatchitNormalForward)` | :<C-U>call matchit#Match_wrapper('',1,'n')<CR> |
| `<Plug>(Hydra5_wait)<S-Up>` | continuous move step up |
| `<C-W><S-Up>` | continuous move step up |
| `<Plug>(Hydra5_wait)<Left>` | move step left |
| `<Plug>(Hydra5_wait)<S-Right>` | continuous move step right |
| `<C-W><S-Right>` | continuous move step right |
| `<Plug>(Hydra5_wait)<Down>` | move step down |
| `<Plug>(Hydra5_wait)<C-H>` | continuous resize narrower |
| `<C-W><C-H>` | continuous resize narrower |
| `<Plug>(Hydra5_wait)<C-J>` | continuous resize shorter |
| `<C-W><C-J>` | continuous resize shorter |
| `<Plug>(Hydra5_wait)<Up>` | move step up |
| `<Plug>(Hydra5_wait)<C-K>` | continuous resize higher |
| `<C-W><C-K>` | continuous resize higher |
| `<Plug>(Hydra5_wait)<C-L>` | continuous resize wider |
| `<C-W><C-L>` | continuous resize wider |
| `<Plug>(Hydra5_wait)<Right>` | move step right |
| `<Plug>(Hydra5_wait) ` | show menu |
| `<C-W> ` | show menu |
| `<Plug>(Hydra5_wait)<S-Left>` | continuous move step left |
| `<C-W><S-Left>` | continuous move step left |
| `<Plug>(Hydra5_wait)<S-Down>` | continuous move step down |
| `<C-W><S-Down>` | continuous move step down |
| `<Plug>(Hydra5_wait)<Esc>` | close menu |
| `<Plug>(Hydra5_wait)` | Lua Function |
| `<Plug>(Hydra4_wait)a` | :AerialToggle! |
| `<Plug>(Hydra4_wait)M` | :Mason |
| `<Plug>(Hydra4_wait)L` | :Lazy |
| `<Plug>(Hydra4_wait)<Esc>` | close |
| `<Plug>(Hydra4_wait).` | replace . with space |
| `<Plug>(Hydra4_wait)d` | :DataViewer |
| `<Plug>(Hydra4_wait)$` | trim file's trailing \s* |
| `<Plug>(Hydra4_wait)A` | :AerialNavToggle |
| `<Plug>(Hydra4_wait)<CR>` | close |
| `<Plug>(Hydra4_wait)t` | :terminal |
| `<Plug>(Hydra4_wait)` | Lua Function |
| `<Plug>(Hydra3_wait)u` | fileencoding=utf8 |
| `<Plug>(Hydra3_wait)v` | virtual edit |
| `<Plug>(Hydra3_wait)M` | modifiable |
| `<Plug>(Hydra3_wait)I` | ignore case |
| `<Plug>(Hydra3_wait)i` | show invisible |
| `<Plug>(Hydra3_wait)s` | spell |
| `<Plug>(Hydra3_wait)n` | number |
| `<Plug>(Hydra3_wait)m` | ft=terminal |
| `<Plug>(Hydra3_wait)C` | ft=csv |
| `<Plug>(Hydra3_wait)2` | ts=sw=2 |
| `<Plug>(Hydra3_wait)t` | expandtab |
| `<Plug>(Hydra3_wait)<Esc>` | Lua Function |
| `<Plug>(Hydra3_wait)<CR>` | Lua Function |
| `<Plug>(Hydra3_wait)D` | diff |
| `<Plug>(Hydra3_wait)p` | paste |
| `<Plug>(Hydra3_wait)8` | ts=sw=8 |
| `<Plug>(Hydra3_wait)4` | ts=sw=4 |
| `<Plug>(Hydra3_wait)3` | ts=sw=3 |
| `<Plug>(Hydra3_wait)c` | cursor column |
| `<Plug>(Hydra3_wait)N` | ft= |
| `<Plug>(Hydra3_wait)l` | cursor line |
| `<Plug>(Hydra3_wait)d` | DiffWhiteSpace |
| `<Plug>(Hydra3_wait)x` | ft=text |
| `<Plug>(Hydra3_wait)H` | hlsearch |
| `<Plug>(Hydra3_wait)r` | relativenumber |
| `<Plug>(Hydra3_wait)w` | wrap |
| `<Plug>(Hydra3_wait)` | Lua Function |
| `<Plug>(Hydra2_wait)u` | fileencoding=utf8 |
| `<Plug>(Hydra2_wait)N` | ft= |
| `<Plug>(Hydra2_wait)s` | spell |
| `<Plug>(Hydra2_wait)v` | virtualedit |
| `<Plug>(Hydra2_wait)c` | cursor column |
| `<Plug>(Hydra2_wait)i` | show invisible |
| `<Plug>(Hydra2_wait)t` | expandtab |
| `<Plug>(Hydra2_wait)M` | modifiable |
| `<Plug>(Hydra2_wait)C` | ft=csv |
| `<Plug>(Hydra2_wait)I` | ignorecase |
| `<Plug>(Hydra2_wait)D` | diff |
| `<Plug>(Hydra2_wait)<Esc>` | Lua Function |
| `<Plug>(Hydra2_wait)<CR>` | Lua Function |
| `<Plug>(Hydra2_wait)m` | ft=terminal |
| `<Plug>(Hydra2_wait)p` | paste |
| `<Plug>(Hydra2_wait)8` | ts=sw=8 |
| `<Plug>(Hydra2_wait)4` | ts=sw=4 |
| `<Plug>(Hydra2_wait)3` | ts=sw=3 |
| `<Plug>(Hydra2_wait)2` | ts=sw=2 |
| `<Plug>(Hydra2_wait)n` | number |
| `<Plug>(Hydra2_wait)l` | cursor line |
| `<Plug>(Hydra2_wait)d` | DiffWhiteSpace |
| `<Plug>(Hydra2_wait)x` | ft=text |
| `<Plug>(Hydra2_wait)H` | hlsearch |
| `<Plug>(Hydra2_wait)r` | relativenumber |
| `<Plug>(Hydra2_wait)w` | wrap |
| `<Plug>(Hydra2_wait)` | Lua Function |
| `<Plug>(Hydra1_wait)l` | ←/→ |
| `<Plug>(Hydra1_wait)L` | half screen ←/→ |
| `<Plug>(Hydra1_wait)h` | Lua Function |
| `<Plug>(Hydra1_wait)H` | Lua Function |
| `<Plug>(Hydra1_wait)<Esc>` | Lua Function |
| `<Plug>(Hydra1_wait)` | Lua Function |
| `<Plug>luasnip-expand-repeat` | LuaSnip: Repeat last node expansion |
| `<Plug>luasnip-delete-check` | LuaSnip: Removes current snippet from jumplist |
| `<S-F1>` | which-key top menu |
| `<F13>` | which-key top menu |
| `<C-S>` | Flash Search the word under cursor |
| `<F1>` | Lua Function |
| `<C-S-Q>` | Lua Function |
| `<C-Down>` | [multicursor] skip cursor and move down |
| `<C-Up>` | [multicursor] skip cursor and move up |
| `<S-Down>` | [multicursor] add cursor and move down |
| `<S-Up>` | [multicursor] add cursor and move up |
| `<F9>` | [DAP] toggle breakpoint |
| `<S-F11>` | [DAP] step out |
| `<F11>` | [DAP] step into |
| `<F10>` | [DAP] step over |
| `<C-S-F5>` | [DAP] restart |
| `<S-F5>` | [DAP] terminate |
| `<F5>` | [DAP] Start/Continue |
| `<F4>` | [DAP-ui] select float |
| `<C-W><C-F>` | open file under cursor into vsplit window |
| `<C-4>` | <Cmd>tablast<CR> |
| `<C-3>` | <Cmd>tabnext<CR> |
| `<C-2>` | <Cmd>tabprevious<CR> |
| `<C-1>` | <Cmd>tabfirst<CR> |
| `<C-S-Tab>` | <Cmd>bp<CR> |
| `<C-Tab>` | <Cmd>bn<CR> |
| `<C-W><C-D>` | Show diagnostics under the cursor |
| `<C-W>d` | Show diagnostics under the cursor |
| `<C-L>` | :help CTRL-L-default |

## Command Mode

| Key | Action / Description |
|-----|----------------------|
| `<Plug>luasnip-expand-repeat` | LuaSnip: Repeat last node expansion |
| `<Plug>luasnip-delete-check` | LuaSnip: Removes current snippet from jumplist |
| `<F13>` | which-key top menu |
| `<S-F1>` | which-key top menu |
| `<C-S>` | [Flash] Toggle Flash during / ? search |
| `<F1>` | Lua Function |

## Insert Mode

| Key | Action / Description |
|-----|----------------------|
| `<Plug>(ccc-insert)` | Lua Function |
| `<Plug>luasnip-expand-repeat` | LuaSnip: Repeat last node expansion |
| `<Plug>luasnip-delete-check` | LuaSnip: Removes current snippet from jumplist |
| `<Plug>luasnip-jump-prev` | LuaSnip: Jump to the previous node |
| `<Plug>luasnip-jump-next` | LuaSnip: Jump to the next node |
| `<Plug>luasnip-prev-choice` | LuaSnip: Change to the previous choice from the choiceNode |
| `<Plug>luasnip-next-choice` | LuaSnip: Change to the next choice from the choiceNode |
| `<Plug>luasnip-expand-snippet` | LuaSnip: Expand the current snippet |
| `<Plug>luasnip-expand-or-jump` | LuaSnip: Expand or jump in the current snippet |
| `<C-J>` | jump previous |
| `<C-L>` | jump next |
| `<C-K>` | expand snip |
| `<F13>` | which-key top menu |
| `<S-F1>` | which-key top menu |
| `<F1>` | Lua Function |
| `<F9>` | [DAP] toggle breakpoint |
| `<S-F11>` | [DAP] step out |
| `<F11>` | [DAP] step into |
| `<F10>` | [DAP] step over |
| `<C-S-F5>` | [DAP] restart |
| `<S-F5>` | [DAP] terminate |
| `<F5>` | [DAP] Start/Continue |
| `<S-Tab>` | vim.snippet.jump if active, otherwise <S-Tab> |
| `<C-S>` | vim.lsp.buf.signature_help() |
| `<C-W>` | :help i_CTRL-W-default |
| `<C-U>` | :help i_CTRL-U-default |
| `<Tab>` | vim.snippet.jump if active, otherwise <Tab> |

## Visual Mode

| Key | Action / Description |
|-----|----------------------|
| `<Tab>` | vim.snippet.jump if active, otherwise <Tab> |
| `<Space>/` | [Flash] search (wrap) |
| `<Space>t` | [Flash] Treesitter |
| `<Space>gf` | [grug-far] find and replace |
| `<Space>gv` | [grug-far] find-and-replace within visual selection |
| `<Space>xx` | [hex] toggle |
| `<Space>xa` | [hex] assemble |
| `<Space>xd` | [hex] dump |
| `<Space>mS` | [multicursor] match back skip cursor |
| `<Space>mN` | [multicursor] match back add cursor |
| `<Space>ms` | [multicursor] match skipcursor |
| `<Space>mn` | [multicursor] match add cursor |
| `<Space>mm` | [multicursor] toggle cursor |
| `<Space>dp` | [DAP] preview |
| `<Space>dh` | [DAP] hover |
| `<Space>dys` | [DAP-python] debug_selection test_class |
| `!` | diagnostic textobj |
| `#` | :help v_#-default |
| `%` | <Plug>(MatchitVisualForward) |
| `*` | :help v_star-default |
| `.` | emoji textobj |
| `@` | :help v_@-default |
| `C` | toNextClosingBracket textobj |
| `Q` | toNextQuotationMark textobj |
| `R` | restOfIndentation textobj |
| `[%` | <Plug>(MatchitVisualMultiBackward) |
| `[N` | Select previous sibling node |
| `[n` | Select previous node |
| `\a` | Actions |
| `\O` | Options2 |
| `\o` | Options |
| `\Gr` | Gitsigns reset_hunk |
| `\Gs` | Gitsigns stage_hunk |
| `\Tp` | tome: play selection |
| `\lf` | format file or range |
| `\Ba` | [Bookmarks] add description |
| `\BG` | [Bookmarks] Grep through bookmarked files |
| `\BLm` | [Bookmarks] mark and link to existing bookmark |
| `\BLi` | [Bookmarks] goto Linked in bookmarks |
| `\BLo` | [Bookmarks] goto Linked out bookmarks |
| `\BLl` | [Bookmarks] Link bookmark |
| `\BX` | [Bookmarks] miX active bookmark into XML |
| `\Blf` | [Bookmarks] current File bookmarks to new list |
| `\Bln` | [Bookmarks] create a New list |
| `\Bl<CR>` | [Bookmarks] pick a List |
| `\BT` | [Bookmarks] Tree view |
| `\BP` | [Bookmarks] Go to previous (by id) |
| `\BN` | [Bookmarks] Go to next (by id) |
| `\Bp` | [Bookmarks] Go to previous (by line number) |
| `\Bn` | [Bookmarks] Go to next (by line number) |
| `\Bg` | [Bookmarks] Go to (select) |
| `\BA` | [Bookmarks] reAttach to root node |
| `\Bd` | [Bookmarks] delete marks in current file |
| `\Bm` | [Bookmarks] Mark/toggle current line |
| `\B:` | [Bookmarks] Command |
| `\Bi` | [Bookmarks] current bookmark Info |
| `\BI` | [Bookmarks] plugin current Info |
| `\sP` | "*P |
| `\sp` | "*p |
| `\sy` | "*y |
| `\P` | paste before from clipboard (reg +) |
| `\p` | Paste after from clipboard (reg +) |
| `\y` | copy to clipboard (reg +) |
| `]%` | <Plug>(MatchitVisualMultiForward) |
| `]N` | Select next sibling node |
| `]n` | Select next node |
| `a%` | <Plug>(MatchitVisualTextObject) |
| `aI` | outer-outer indentation textobj |
| `ai` | outer-inner indentation textobj |
| `a#` | outer color textobj |
| `aD` | outer doubleSquareBrackets textobj |
| `ao` | outer anyBracket textobj |
| `aq` | outer anyQuote textobj |
| `a,` | outer argument textobj |
| `aS` | outer subword textobj |
| `a_` | outer lineCharacterwise textobj |
| `ag` | outer greedyOuterIndentation textobj |
| `ak` | outer key textobj |
| `av` | outer value textobj |
| `aF` | outer filepath textobj |
| `aN` | outer notebookCell textobj |
| `az` | outer closedFold textobj |
| `an` | outer number textobj |
| `g%` | <Plug>(MatchitVisualBackward) |
| `g;` | lastChange textobj |
| `gw` | visibleInWindow textobj |
| `gG` | entireBuffer textobj |
| `gW` | restOfWindow textobj |
| `gra` | vim.lsp.buf.code_action() |
| `gc` | Toggle comment |
| `gx` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |
| `iI` | inner-inner indentation textobj |
| `ii` | inner-inner indentation textobj |
| `i#` | inner color textobj |
| `iD` | inner doubleSquareBrackets textobj |
| `io` | inner anyBracket textobj |
| `iq` | inner anyQuote textobj |
| `i,` | inner argument textobj |
| `iS` | inner subword textobj |
| `i_` | inner lineCharacterwise textobj |
| `ig` | inner greedyOuterIndentation textobj |
| `ik` | inner key textobj |
| `iv` | inner value textobj |
| `iF` | inner filepath textobj |
| `iN` | inner notebookCell textobj |
| `iz` | inner closedFold textobj |
| `ih` | Gitsigns select_hunk |
| `in` | inner number textobj |
| `m<S-Down>` | [Bookmarks] Go to next (by id) |
| `m<S-Up>` | [Bookmarks] Go to previous (by id) |
| `m<Down>` | [Bookmarks] Go to next (by line number) |
| `m<Up>` | [Bookmarks] Go to previous (by line number) |
| `m\` | [Bookmarks] command |
| `m<Del>` | delete marks of current file |
| `m<CR>` | [Bookmarks] Go to (select) |
| `m ` | [Bookmarks] Mark current line. |
| `n` | nearEoL textobj |
| `\|` | column textobj |
| `<Plug>(MatchitVisualTextObject)` | <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward) |
| `<Plug>(MatchitVisualMultiForward)` | :<C-U>call matchit#MultiMatch("W",  "n")<CR>m'gv`` |
| `<Plug>(MatchitVisualMultiBackward)` | :<C-U>call matchit#MultiMatch("bW", "n")<CR>m'gv`` |
| `<Plug>(MatchitVisualBackward)` | :<C-U>call matchit#Match_wrapper('',0,'v')<CR>m'gv`` |
| `<Plug>(MatchitVisualForward)` | :<C-U>call matchit#Match_wrapper('',1,'v')<CR>:if col("''") != col("$") \| exe ":normal! m'" \| endif<CR>gv`` |
| `<Plug>(ccc-select-color)` | Lua Function |
| `<Plug>(Hydra4_wait)a` | :AerialToggle! |
| `<Plug>(Hydra4_wait)M` | :Mason |
| `<Plug>(Hydra4_wait)L` | :Lazy |
| `<Plug>(Hydra4_wait)<Esc>` | close |
| `<Plug>(Hydra4_wait).` | replace . with space |
| `<Plug>(Hydra4_wait)d` | :DataViewer |
| `<Plug>(Hydra4_wait)$` | trim file's trailing \s* |
| `<Plug>(Hydra4_wait)A` | :AerialNavToggle |
| `<Plug>(Hydra4_wait)<CR>` | close |
| `<Plug>(Hydra4_wait)t` | :terminal |
| `<Plug>(Hydra4_wait)` | Lua Function |
| `<Plug>(Hydra3_wait)u` | fileencoding=utf8 |
| `<Plug>(Hydra3_wait)v` | virtual edit |
| `<Plug>(Hydra3_wait)M` | modifiable |
| `<Plug>(Hydra3_wait)I` | ignore case |
| `<Plug>(Hydra3_wait)i` | show invisible |
| `<Plug>(Hydra3_wait)s` | spell |
| `<Plug>(Hydra3_wait)n` | number |
| `<Plug>(Hydra3_wait)m` | ft=terminal |
| `<Plug>(Hydra3_wait)C` | ft=csv |
| `<Plug>(Hydra3_wait)2` | ts=sw=2 |
| `<Plug>(Hydra3_wait)t` | expandtab |
| `<Plug>(Hydra3_wait)<Esc>` | Lua Function |
| `<Plug>(Hydra3_wait)<CR>` | Lua Function |
| `<Plug>(Hydra3_wait)D` | diff |
| `<Plug>(Hydra3_wait)p` | paste |
| `<Plug>(Hydra3_wait)8` | ts=sw=8 |
| `<Plug>(Hydra3_wait)4` | ts=sw=4 |
| `<Plug>(Hydra3_wait)3` | ts=sw=3 |
| `<Plug>(Hydra3_wait)c` | cursor column |
| `<Plug>(Hydra3_wait)N` | ft= |
| `<Plug>(Hydra3_wait)l` | cursor line |
| `<Plug>(Hydra3_wait)d` | DiffWhiteSpace |
| `<Plug>(Hydra3_wait)x` | ft=text |
| `<Plug>(Hydra3_wait)H` | hlsearch |
| `<Plug>(Hydra3_wait)r` | relativenumber |
| `<Plug>(Hydra3_wait)w` | wrap |
| `<Plug>(Hydra3_wait)` | Lua Function |
| `<Plug>(Hydra2_wait)u` | fileencoding=utf8 |
| `<Plug>(Hydra2_wait)N` | ft= |
| `<Plug>(Hydra2_wait)s` | spell |
| `<Plug>(Hydra2_wait)v` | virtualedit |
| `<Plug>(Hydra2_wait)c` | cursor column |
| `<Plug>(Hydra2_wait)i` | show invisible |
| `<Plug>(Hydra2_wait)t` | expandtab |
| `<Plug>(Hydra2_wait)M` | modifiable |
| `<Plug>(Hydra2_wait)C` | ft=csv |
| `<Plug>(Hydra2_wait)I` | ignorecase |
| `<Plug>(Hydra2_wait)D` | diff |
| `<Plug>(Hydra2_wait)<Esc>` | Lua Function |
| `<Plug>(Hydra2_wait)<CR>` | Lua Function |
| `<Plug>(Hydra2_wait)m` | ft=terminal |
| `<Plug>(Hydra2_wait)p` | paste |
| `<Plug>(Hydra2_wait)8` | ts=sw=8 |
| `<Plug>(Hydra2_wait)4` | ts=sw=4 |
| `<Plug>(Hydra2_wait)3` | ts=sw=3 |
| `<Plug>(Hydra2_wait)2` | ts=sw=2 |
| `<Plug>(Hydra2_wait)n` | number |
| `<Plug>(Hydra2_wait)l` | cursor line |
| `<Plug>(Hydra2_wait)d` | DiffWhiteSpace |
| `<Plug>(Hydra2_wait)x` | ft=text |
| `<Plug>(Hydra2_wait)H` | hlsearch |
| `<Plug>(Hydra2_wait)r` | relativenumber |
| `<Plug>(Hydra2_wait)w` | wrap |
| `<Plug>(Hydra2_wait)` | Lua Function |
| `<Plug>luasnip-jump-prev` | LuaSnip: Jump to the previous node |
| `<Plug>luasnip-jump-next` | LuaSnip: Jump to the next node |
| `<Plug>luasnip-prev-choice` | LuaSnip: Change to the previous choice from the choiceNode |
| `<Plug>luasnip-next-choice` | LuaSnip: Change to the next choice from the choiceNode |
| `<Plug>luasnip-expand-snippet` | LuaSnip: Expand the current snippet |
| `<Plug>luasnip-expand-or-jump` | LuaSnip: Expand or jump in the current snippet |
| `<Plug>luasnip-expand-repeat` | LuaSnip: Repeat last node expansion |
| `<C-J>` | jump previous |
| `<C-L>` | jump next |
| `<F13>` | which-key top menu |
| `<S-F1>` | which-key top menu |
| `<C-S>` | [Flash] Treesitter search |
| `<F1>` | Lua Function |
| `<C-Down>` | [multicursor] skip cursor and move down |
| `<C-Up>` | [multicursor] skip cursor and move up |
| `<S-Down>` | [multicursor] add cursor and move down |
| `<S-Up>` | [multicursor] add cursor and move up |
| `<F9>` | [DAP] toggle breakpoint |
| `<S-F11>` | [DAP] step out |
| `<F11>` | [DAP] step into |
| `<F10>` | [DAP] step over |
| `<C-S-F5>` | [DAP] restart |
| `<S-F5>` | [DAP] terminate |
| `<F5>` | [DAP] Start/Continue |
| `<S-Tab>` | vim.snippet.jump if active, otherwise <S-Tab> |
| `<C-S>` | vim.lsp.buf.signature_help() |

