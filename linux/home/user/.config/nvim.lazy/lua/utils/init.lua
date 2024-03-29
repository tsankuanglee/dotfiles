-- credit:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/init.lua

local M = {}

function M.is_win() return vim.loop.os_uname().sysname:find("Windows") ~= nil end

-- Wrapper around vim.keymap.set that will
-- not create a keymap if a lazy key handler exists.
-- It will also set `silent` to true by default.
--function M.safe_keymap_set(mode, lhs, rhs, opts)
--  local keys = require("lazy.core.handler").handlers.keys
--  ---@cast keys LazyKeysHandler
--  local modes = type(mode) == "string" and { mode } or mode
--
--  ---@param m string
--  modes = vim.tbl_filter(function(m)
--    return not (keys.have and keys:have(lhs, m))
--  end, modes)
--
--  -- do not create the keymap if a lazy keys handler exists
--  if #modes > 0 then
--    opts = opts or {}
--    opts.silent = opts.silent ~= false
--    if opts.remap and not vim.g.vscode then
--      ---@diagnostic disable-next-line: no-unknown
--      opts.remap = nil
--    end
--    vim.keymap.set(modes, lhs, rhs, opts)
--  end
--end

-- keymap shortcut function
function M.km(mode, lhs, rhs, desc, extra_opts)
  if extra_opts == nil then extra_opts = {} end
  return vim.keymap.set(mode, lhs, rhs, {
    noremap = true,
    silent = true,
    desc = desc,
    unpack(extra_opts),
  })
end

-- Search for a value in a sequence.
function M.index(seq, elem)
  for i, v in ipairs(seq) do
    if v == elem then return i end
  end
  return nil
end

-- table length
function M.tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function M.toggle_option_var_element(opt_var, element_value)
  local v = opt_var:get()
  local i = self.index(v, element_value)

  if i then
    table.remove(v, i)
  else
    table.insert(v, i)
  end

  opt_var = v
end

function M.run_and_register_highlight_change(group_name, fn_change_highlight)
  -- register highlight changes after each ColorScheme change
  local augroup = vim.api.nvim_create_augroup(group_name, { clear = false })
  vim.api.nvim_create_autocmd("ColorScheme", { group = augroup, callback = fn_change_highlight })
  fn_change_highlight()
end

return M
