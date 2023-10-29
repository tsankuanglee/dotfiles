-- repeat counted motion with ; and ,
return {
  "Houl/repmo-vim",
  --lazy = true,
  config = function()
    vim.cmd([[
    " map a motion and its reverse motion:
    noremap <expr> h repmo#SelfKey('h', 'l')|sunmap h
    noremap <expr> l repmo#SelfKey('l', 'h')|sunmap l
    noremap <expr> j repmo#SelfKey('j', 'k')|sunmap j
    noremap <expr> k repmo#SelfKey('k', 'j')|sunmap k

    noremap <expr> <C-E> repmo#SelfKey('<C-E>', '<C-Y>')
    noremap <expr> <C-Y> repmo#SelfKey('<C-Y>', '<C-E>')

    " word
    noremap <expr> w repmo#SelfKey('w', 'b')|sunmap w
    noremap <expr> b repmo#SelfKey('b', 'w')|sunmap b
    noremap <expr> e repmo#SelfKey('e', 'ge')|sunmap e
    " WORD
    noremap <expr> W repmo#SelfKey('W', 'B')|sunmap W
    noremap <expr> B repmo#SelfKey('B', 'W')|sunmap B
    noremap <expr> E repmo#SelfKey('E', 'gE')|sunmap E

    " add these mappings when repeating with `;' or `,':
    noremap <expr> f repmo#ZapKey('f')|sunmap f
    noremap <expr> F repmo#ZapKey('F')|sunmap F
    noremap <expr> t repmo#ZapKey('t')|sunmap t
    noremap <expr> T repmo#ZapKey('T')|sunmap T

    " repeat the last [count]motion or the last zap-key:
    map <expr> ; repmo#LastKey(';')|sunmap ;
    map <expr> , repmo#LastRevKey(',')|sunmap ,

    ]])
  end,
}