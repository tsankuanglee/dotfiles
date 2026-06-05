local set_ts_sw = function (n)
  vim.bo.tabstop = n
  vim.bo.shiftwidth = n
end

local function isidiffwhite()
  return vim.tbl_contains(vim.opt.diffopt:get(), "iwhiteall")
end

local M = {}

M.setup = function()
  local Hydra = require("hydra")
  local builder = require("plugins.ui.hydra.hydra-builder")

  local col1 = {
    { key = "w", desc = "wrap", toggle_func = "wrap", toggle_check = function() return vim.o.wrap end, exit = false, action = function()
      if vim.o.wrap ~= true then
        vim.o.wrap = true
        vim.keymap.set("n", "k", function() return vim.v.count > 0 and "k" or "gk" end, { expr = true, desc = "k or gk" })
        vim.keymap.set("n", "j", function() return vim.v.count > 0 and "j" or "gj" end, { expr = true, desc = "j or gj" })
      else
        vim.o.wrap = false
        pcall(vim.keymap.del, "n", "k")
        pcall(vim.keymap.del, "n", "j")
      end
    end },
    { key = "n", desc = "number", toggle_func = "nu", toggle_check = function() return vim.o.number end, action = function() vim.o.number = not vim.o.number end },
    { key = "r", desc = "relativenumber", toggle_func = "rnu", toggle_check = function() return vim.o.relativenumber end, action = function()
      if vim.o.relativenumber == true then
        vim.o.relativenumber = false
      else
        vim.o.number = true
        vim.o.relativenumber = true
      end
    end },
    {},
    { key = "l", desc = "cursor line", toggle_func = "cul", toggle_check = function() return vim.o.cursorline end, action = function() vim.o.cursorline = not vim.o.cursorline end },
    { key = "c", desc = "cursor column", toggle_func = "cuc", toggle_check = function() return vim.wo.cursorcolumn end, action = function() vim.wo.cursorcolumn = not vim.wo.cursorcolumn end },
    { title = "Visuals", hl = "Title" },
    { key = "v", desc = "virtual edit", toggle_func = "ve", toggle_check = function() return vim.o.virtualedit == "all" end, action = function()
      if vim.o.virtualedit == "all" then vim.o.virtualedit = "block" else vim.o.virtualedit = "all" end
    end },
    { key = "i", desc = "show invisible", toggle_func = "list", toggle_check = function() return vim.o.list end, action = function() vim.o.list = not vim.o.list end },
    { title = "Search & Diff", hl = "Title" },
    { key = "d", desc = "diff white spaces", toggle_func = "isidw", toggle_check = isidiffwhite, action = function()
      if isidiffwhite() then vim.opt.diffopt:remove("iwhiteall") else vim.opt.diffopt:append("iwhiteall") end
    end },
    { key = "D", desc = "diff", toggle_func = "isdif", toggle_check = function() return vim.wo.diff end, action = function() vim.wo.diff = not vim.wo.diff end },
    { key = "H", desc = "hlsearch", toggle_func = "ishls", toggle_check = function() return vim.o.hlsearch end, action = function() vim.o.hlsearch = not vim.o.hlsearch end },
    { key = "I", desc = "ignore case", toggle_func = "isic", toggle_check = function() return vim.o.ignorecase end, action = function() vim.o.ignorecase = not vim.o.ignorecase end },
    { key = "s", desc = "spell", toggle_func = "spell", toggle_check = function() return vim.o.spell end, exit = true, action = function() vim.o.spell = not vim.o.spell end },
  }

  local col2 = {
    { key = "u", desc = "utf-8", exit = true, action = function() vim.bo.fileencoding = "utf8" end },
    { key = "N", desc = "ft=", exit = true, action = function() vim.bo.filetype = "" end },
    { key = "C", desc = "ft=csv", exit = true, action = function() vim.bo.filetype = "csv" end },
    { key = "x", desc = "ft=text", exit = true, action = function() vim.bo.filetype = "text" end },
    { key = "m", desc = "ft=terminal", exit = true, action = function() vim.bo.filetype = "terminal" end },
    {},
    { key = "M", desc = "modifiable", toggle_func = "ismod", toggle_check = function() return vim.bo.modifiable end, action = function() vim.bo.modifiable = not vim.bo.modifiable end },
    { title="Tab/space" },
    { key = "2", desc = "ts=sw=2", exit = true, action = function() set_ts_sw(2) end },
    { key = "3", desc = "ts=sw=3", exit = true, action = function() set_ts_sw(3) end },
    { key = "4", desc = "ts=sw=4", exit = true, action = function() set_ts_sw(4) end },
    { key = "8", desc = "ts=sw=8", exit = true, action = function() set_ts_sw(8) end },
    { key = "t", desc = "expandtab", toggle_func = "iset", toggle_check = function() return vim.bo.expandtab end, action = function() vim.bo.expandtab = not vim.bo.expandtab end },
    {},
    { key = "p", desc = "paste", toggle_func = "isp", toggle_check = function() return vim.o.paste end, action = function() vim.o.paste = not vim.o.paste end },
  }

  M.hydra = Hydra({
    name = "Options",
    hint = builder.generate_hint("Options", { col1, col2 }),
    config = {
      color = "amaranth",
      invoke_on_body = true,
      hint = {
        funcs = builder.generate_funcs({ col1, col2 }),
        position = "middle",
        float_opts = {},
      },
    },
    mode = { "n", "x" },
    body = "<leader>o",
    heads = builder.generate_heads({ col1, col2 }),
  })
end

M.activate = function()
  if M.hydra then M.hydra:activate() end
end

return M
