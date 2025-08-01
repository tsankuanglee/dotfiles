local hint = [[
          ^^^^          Options

  _w_ %{wrap}^ wrap                      _u_ utf-8
  _n_ %{nu}^^^ number                    _N_ ft=
  _r_ %{rnu}^^ relative number           _C_ ft=csv
  _l_ %{cul}^^ cursor line               _x_ ft=text
  _c_ %{cuc}^^ cursor column             _m_ ft=terminal
  _v_ %{ve}^^^ virtual edit
  _i_ %{list}^ invisible characters      _2_ ts=sw=2
       ^^^^^^^                           _3_ ts=sw=3
  _s_ %{spell} spell                     _4_ ts=sw=4
  _d_ %{isidw} ignore diff white spaces  _8_ ts=sw=8
  _D_ %{isdif} diff                      _t_ %{iset} expandtab
  _H_ %{ishls} hlsearch
  _I_ %{isic}^ ignore case               _p_ %{isp}^^ paste
  _M_ %{ismod} modifiable
  ^
          ^^^^        _<Esc>_ _<CR>_
]]

local function isidiffwhite()
  return vim.tbl_contains(vim.opt.diffopt:get(), "iwhiteall")
end

local set_ts_sw = function (n)
  vim.bo.tabstop = n
  vim.bo.shiftwidth = n
end

local setup = function()
  local Hydra = require("hydra")
  Hydra({
    name = "Options",
    hint = hint,
    config = {
      color = "amaranth",
      invoke_on_body = true,
      hint = {
        funcs = {
          cuc = function ()
            if vim.wo.cursorcolumn then return '[✓]' else return '[ ]' end
          end,
          isidw = function ()
            if isidiffwhite() then return '[✓]' else return '[ ]' end
          end,
          isp = function ()
            if vim.o.paste then return '[✓]' else return '[ ]' end
          end,
          ismod = function ()
            if vim.bo.modifiable then return '[✓]' else return '[ ]' end
          end,
          iset = function ()
            if vim.bo.expandtab then return '[✓]' else return '[ ]' end
          end,
          isic = function ()
            if vim.o.ignorecase then return '[✓]' else return '[ ]' end
          end,
          isdif = function ()
            if vim.wo.diff then return '[✓]' else return '[ ]' end
          end,
          ishls = function ()
            if vim.o.hlsearch then return '[✓]' else return '[ ]' end
          end,
        },
        position = "middle",
        float_opts = {},
      },
    },
    mode = { "n", "x" },
    body = "<leader>o",
    heads = {
      {
        "d",
        function()
          if isidiffwhite() then
            vim.opt.diffopt:remove("iwhiteall")
          else
            vim.opt.diffopt:append("iwhiteall")
          end
        end,
        { desc = "DiffWhiteSpace" },
      },
      { "n", function() vim.o.number = not vim.o.number end, { desc = "number" } },
      {
        "r",
        function()
          if vim.o.relativenumber == true then
            vim.o.relativenumber = false
          else
            vim.o.number = true
            vim.o.relativenumber = true
          end
        end,
        { desc = "relativenumber" },
      },
      {
        "v",
        function()
          if vim.o.virtualedit == "all" then
            vim.o.virtualedit = "block"
          else
            vim.o.virtualedit = "all"
          end
        end,
        { desc = "virtualedit" },
      },
      { "i", function() vim.o.list = not vim.o.list end, { desc = "show invisible" } },
      { "s", function() vim.o.spell = not vim.o.spell end, { exit = true, desc = "spell" }, },
      {
        "w",
        function()
          if vim.o.wrap ~= true then
            vim.o.wrap = true
            -- Dealing with word wrap:
            -- If cursor is inside very long line in the file than wraps
            -- around several rows on the screen, then 'j' key moves you to
            -- the next line in the file, but not to the next row on the
            -- screen under your previous position as in other editors. These
            -- bindings fixes this.
            vim.keymap.set(
              "n",
              "k",
              function() return vim.v.count > 0 and "k" or "gk" end,
              { expr = true, desc = "k or gk" }
            )
            vim.keymap.set(
              "n",
              "j",
              function() return vim.v.count > 0 and "j" or "gj" end,
              { expr = true, desc = "j or gj" }
            )
          else
            vim.o.wrap = false
            vim.keymap.del("n", "k")
            vim.keymap.del("n", "j")
          end
        end,
        { desc = "wrap" },
      },
      { "l", function() vim.o.cursorline = not vim.o.cursorline end, { desc = "cursor line" }, },
      { "c", function() vim.wo.cursorcolumn = not vim.wo.cursorcolumn end, { desc = "cursor column" }, },
      { "p", function() vim.o.paste = not vim.o.paste end, { desc = "paste" }, },

      { "u", function() vim.bo.fileencoding = "utf8" end, { exit = true, desc = "fileencoding=utf8" }, },
      { "N", function() vim.bo.filetype = "" end, { exit = true, desc = "ft=" }, },
      { "C", function() vim.bo.filetype = "csv" end, { exit = true, desc = "ft=csv" }, },
      { "x", function() vim.bo.filetype = "text" end, { exit = true, desc = "ft=text" }, },
      { "m", function() vim.bo.filetype = "terminal" end, { exit = true, desc = "ft=terminal" }, },

      { "2", function() set_ts_sw(2) end, { exit = true, desc = "ts=sw=2" }, },
      { "3", function() set_ts_sw(3) end, { exit = true, desc = "ts=sw=3" }, },
      { "4", function() set_ts_sw(4) end, { exit = true, desc = "ts=sw=4" }, },
      { "8", function() set_ts_sw(8) end, { exit = true, desc = "ts=sw=8" }, },
      { "t", function() vim.bo.expandtab = not vim.bo.expandtab end, { exit = false, desc = "expandtab" }, },
      { "M", function() vim.bo.modifiable = not vim.bo.modifiable end, { exit = false, desc = "modifiable" }, },
      { "I", function() vim.o.ignorecase = not vim.o.ignorecas end, { exit = false, desc = "ignorecase" }, },
      { "D", function() vim.wo.diff = not vim.wo.diff end, { exit = false, desc = "diff" }, },
      { "H", function() vim.o.hlsearch = not vim.o.hlsearch end, { exit = false, desc = "hlsearch" }, },
      { "<Esc>", nil, { exit = true } },
      { "<CR>", nil, { exit = true } },
    },
  })
  -- code
end

return {
  setup = setup,
}
