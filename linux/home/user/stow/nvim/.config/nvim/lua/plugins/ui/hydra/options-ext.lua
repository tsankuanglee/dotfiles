local M = {}

-- Helper function to check if a value is in a table
local function is_in_table(tbl, value)
  return vim.tbl_contains(tbl, value)
end

-- Configuration table for options
local options = {
  -- Toggle options (window or global)
  { key = "w", desc = "wrap", scope = "o", opt = "wrap", on_toggle = function(val)
    if val then
      vim.keymap.set("n", "k", function() return vim.v.count > 0 and "k" or "gk" end, { expr = true, desc = "k or gk" })
      vim.keymap.set("n", "j", function() return vim.v.count > 0 and "j" or "gj" end, { expr = true, desc = "j or gj" })
    else
      vim.keymap.del("n", "k")
      vim.keymap.del("n", "j")
    end
  end },
  { key = "n", desc = "number", scope = "o", opt = "number" },
  { key = "r", desc = "relativenumber", scope = "o", opt = "relativenumber", on_toggle = function(val)
    if val then vim.o.number = true end
  end },
  { key = "l", desc = "cursor line", scope = "o", opt = "cursorline" },
  { key = "c", desc = "cursor column", scope = "wo", opt = "cursorcolumn" },
  { key = "s", desc = "spell", scope = "o", opt = "spell", exit = true },
  { key = "i", desc = "show invisible", scope = "o", opt = "list" },
  { key = "v", desc = "virtual edit", scope = "o", opt = "virtualedit", toggle_values = { "all", "block" } },
  { key = "p", desc = "paste", scope = "o", opt = "paste" },
  { key = "I", desc = "ignore case", scope = "o", opt = "ignorecase" },
  { key = "H", desc = "hlsearch", scope = "o", opt = "hlsearch" },
  { key = "M", desc = "modifiable", scope = "bo", opt = "modifiable" },
  { key = "D", desc = "diff", scope = "wo", opt = "diff" },
  { key = "d", desc = "DiffWhiteSpace", scope = "opt", opt = "diffopt", toggle_value = "iwhiteall", check = function()
    return is_in_table(vim.opt.diffopt:get(), "iwhiteall")
  end },

  -- Setter options
  { key = "u", desc = "fileencoding=utf8", scope = "bo", opt = "fileencoding", value = "utf8", exit = true },
  { key = "N", desc = "ft=", scope = "bo", opt = "filetype", value = "", exit = true },
  { key = "C", desc = "ft=csv", scope = "bo", opt = "filetype", value = "csv", exit = true },
  { key = "x", desc = "ft=text", scope = "bo", opt = "filetype", value = "text", exit = true },
  { key = "m", desc = "ft=terminal", scope = "bo", opt = "filetype", value = "terminal", exit = true },
  { key = "2", desc = "ts=sw=2", action = function() vim.bo.tabstop = 2; vim.bo.shiftwidth = 2 end, exit = true },
  { key = "3", desc = "ts=sw=3", action = function() vim.bo.tabstop = 3; vim.bo.shiftwidth = 3 end, exit = true },
  { key = "4", desc = "ts=sw=4", action = function() vim.bo.tabstop = 4; vim.bo.shiftwidth = 4 end, exit = true },
  { key = "8", desc = "ts=sw=8", action = function() vim.bo.tabstop = 8; vim.bo.shiftwidth = 8 end, exit = true },
  { key = "t", desc = "expandtab", scope = "bo", opt = "expandtab" },
}

-- Generate hint dynamically
local function generate_hint()
  local lines = { "", "          Options", "" }
  local max_desc_len = math.max(unpack(vim.tbl_map(function(opt) return #opt.desc end, options)))
  local col_width = max_desc_len + 10 -- Adjust for padding and checkboxes

  local left_col, right_col = {}, {}
  for i, opt in ipairs(options) do
    local checkbox = string.format("%%{%s}", opt.key)
    local line = string.format(" _%s_ %s%s", opt.key, checkbox, opt.desc)
    if i <= math.ceil(#options / 2) then
      table.insert(left_col, line .. string.rep(" ", col_width - #opt.desc))
    else
      table.insert(right_col, line)
    end
  end

  -- Combine columns
  for i = 1, math.max(#left_col, #right_col) do
    local left = left_col[i] or string.rep(" ", col_width)
    local right = right_col[i] or ""
    table.insert(lines, left .. "  " .. right)
  end

  table.insert(lines, "")
  table.insert(lines, "          _<Esc>_ _<CR>_")
  return table.concat(lines, "\n")
end

-- Generate Hydra heads
local function generate_heads()
  local heads = {}
  for _, opt in ipairs(options) do
    local head = { opt.key }
    if opt.action then
      head[2] = opt.action
    elseif opt.scope == "opt" and opt.toggle_value then
      head[2] = function()
        if opt.check() then
          vim.opt[opt.opt]:remove(opt.toggle_value)
        else
          vim.opt[opt.opt]:append(opt.toggle_value)
        end
      end
    elseif opt.value then
      head[2] = function() vim[opt.scope][opt.opt] = opt.value end
    elseif opt.toggle_values then
      head[2] = function()
        local current = vim[opt.scope][opt.opt]
        vim[opt.scope][opt.opt] = current == opt.toggle_values[1] and opt.toggle_values[2] or opt.toggle_values[1]
      end
    else
      head[2] = function()
        vim[opt.scope][opt.opt] = not vim[opt.scope][opt.opt]
        if opt.on_toggle then opt.on_toggle(vim[opt.scope][opt.opt]) end
      end
    end
    head[3] = { desc = opt.desc, exit = opt.exit or false }
    table.insert(heads, head)
  end
  table.insert(heads, { "<Esc>", nil, { exit = true } })
  table.insert(heads, { "<CR>", nil, { exit = true } })
  return heads
end

-- Generate hint functions
local function generate_hint_funcs()
  local funcs = {}
  for _, opt in ipairs(options) do
    if opt.scope == "opt" and opt.toggle_value then
      funcs[opt.key] = function() return opt.check() and "[✓]" or "[ ]" end
    else
      funcs[opt.key] = function()
        local val = opt.scope and vim[opt.scope][opt.opt] or vim.bo.tabstop
        return val and "[✓]" or "[ ]"
      end
    end
  end
  return funcs
end

function M.setup()
  local Hydra = require("hydra")
  Hydra({
    name = "Options2",
    hint = generate_hint(),
    config = {
      color = "amaranth",
      invoke_on_body = true,
      hint = {
        funcs = generate_hint_funcs(),
        position = "middle",
        float_opts = {},
      },
    },
    mode = { "n", "x" },
    body = "<leader>O",
    heads = generate_heads(),
  })
end

return M
