-- ==============================================================================
-- Hydra UI Builder
-- ==============================================================================
-- A declarative, grid-based builder for hydra.nvim that completely eliminates
-- the need to manually align ASCII art strings.
--
-- Features:
--   * Dynamic Alignment: Automatically calculates exact padding to keep 
--     multiple columns perfectly aligned, even when Hydra strips escape chars.
--   * Checkbox Toggles: Support for dynamic `[✓]` / `[ ]` hint states.
--   * Section Titles: Support for inserting centered section titles with
--     customizable Neovim syntax highlighting.
--   * Separators: Support for inserting blank lines in columns.
--
-- Usage:
--   local builder = require("utils.hydra_builder")
--
--   local col1 = {
--     -- 1. Standard keybind
--     { key = "w", desc = "wrap", action = function() ... end, exit = false },
--     
--     -- 2. Toggle item (requires `toggle_func` and `toggle_check`)
--     --    The toggle check should return a boolean.
--     { key = "n", desc = "number", toggle_func = "nu", toggle_check = function() return vim.o.nu end, action = ... },
--     
--     -- 3. Blank spacer line
--     {},
--     
--     -- 4. Section title (automatically centered and highlighted)
--     --    `hl` is optional and defaults to "Title". You can use "HydraRed", "Keyword", etc.
--     { title = "Visual Options", hl = "HydraAmaranth" },
--   }
--
--   local col2 = { ... }
--
--   Hydra({
--     name = "My Hydra",
--     hint = builder.generate_hint("Menu Title", { col1, col2 }),
--     heads = builder.generate_heads({ col1, col2 }),
--     config = {
--       hint = {
--         -- Generate dynamic function hooks for the checkboxes
--         funcs = builder.generate_funcs({ col1, col2 })
--       }
--     }
--   })
-- ==============================================================================

local M = {}
M.titles = {}

-- Automatically highlight section titles in the Hydra hint window
vim.api.nvim_create_autocmd("FileType", {
  pattern = "hydra_hint",
  callback = function(args)
    local bufnr = args.buf
    local ns = vim.api.nvim_create_namespace("hydra_titles")
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    for i, line in ipairs(lines) do
      for title, hl in pairs(M.titles) do
        local start_col = 1
        while true do
          local s, e = line:find(title, start_col, true)
          if not s then break end
          vim.api.nvim_buf_add_highlight(bufnr, ns, hl, i - 1, s - 1, e)
          start_col = e + 1
        end
      end
    end
  end
})

-- Helper to calculate the visual length of a string as rendered by Hydra
local function get_desc_len(desc)
  if not desc then return 0 end
  -- Hydra consumes escape characters. For example, `\\s` renders as `\s`.
  -- So every `\` that acts as an escape character reduces the visual length by 1.
  -- We'll approximate this by subtracting the number of backslashes minus escaped backslashes.
  -- Simply, if we replace `\\` with `\` for length calculation:
  local display_str = string.gsub(desc, "\\\\", "\\")
  return #display_str
end

-- Helper to calculate the maximum visual width of a column
local function get_max_width(items)
  local max = 0
  for _, item in ipairs(items) do
    if item.key and item.desc then
      -- True visual length without Hydra's `_` escape characters
      local visual_len = 1 + #item.key + 1 + get_desc_len(item.desc)
      if item.toggle_func then
        visual_len = visual_len + 4 -- space + "[X]" width
      end
      if visual_len > max then
        max = visual_len
      end
    elseif item.title then
      local visual_len = #item.title
      if visual_len > max then
        max = visual_len
      end
    end
  end
  return max
end

-- Function to generate a scalable ASCII hint grid
function M.generate_hint(title, columns, opts)
  opts = opts or {}
  local lines = { "", "  " .. (title or "Hydra"), "" }

  local col_widths = {}
  local max_rows = 0

  for i, col in ipairs(columns) do
    col_widths[i] = get_max_width(col)
    if #col > max_rows then
      max_rows = #col
    end
  end

  for row = 1, max_rows do
    local line_parts = {}
    for col_idx, col in ipairs(columns) do
      local item = col[row]
      local cell = ""
      local visual_len = 0
      
      if item and item.key and item.desc then
        local key_str = string.format("_%s_", item.key)
        local desc_len = get_desc_len(item.desc)
        if item.toggle_func then
          cell = string.format(" %s %%{%s} %s", key_str, item.toggle_func, item.desc)
          visual_len = 1 + #item.key + 1 + 3 + 1 + desc_len -- true visual length
        else
          cell = string.format(" %s %s", key_str, item.desc)
          visual_len = 1 + #item.key + 1 + desc_len -- true visual length
        end
      elseif item and item.title then
        local col_width = col_widths[col_idx] or 0
        local left_pad = math.max(0, math.floor((col_width - #item.title) / 2))
        cell = string.rep(" ", left_pad) .. item.title
        visual_len = left_pad + #item.title
        
        -- Register this title for syntax highlighting
        M.titles[item.title] = item.hl or "Title"
      end
      -- pad cell based on visual length, not raw string length
      local padding_amount = (col_widths[col_idx] or 0) - visual_len + 2
      local padding = string.rep(" ", math.max(0, padding_amount))
      table.insert(line_parts, cell .. padding)
    end
    table.insert(lines, "  " .. table.concat(line_parts, "  "))
  end

  table.insert(lines, "")
  if opts.hide_back then
    table.insert(lines, "  _<Esc>_ _<CR>_ close")
  else
    table.insert(lines, "  _<BS>_ back   _<Esc>_ _<CR>_ close")
  end
  return table.concat(lines, "\n")
end

-- Function to convert builder items into Hydra heads
function M.generate_heads(columns, opts)
  opts = opts or {}
  local heads = {}
  local seen_keys = {}
  
  for _, col in ipairs(columns) do
    for _, item in ipairs(col) do
      if item.key then
        if seen_keys[item.key] then
          error(string.format("Hydra Builder Error: Duplicate key '%s' detected! Keys must be unique.", item.key))
        end
        seen_keys[item.key] = true
        
        local head = { item.key }
        if item.action then
          head[2] = item.action
        end
        head[3] = { desc = item.desc, exit = item.exit or false }
        table.insert(heads, head)
      end
    end
  end
  
  -- Add default close/back keys if not already defined manually
  if not opts.hide_back and not seen_keys["<BS>"] then
    table.insert(heads, { "<BS>", function() require("plugins.ui.hydra.hydra-main").activate() end, { exit = true, desc = false } })
  end
  if not seen_keys["<Esc>"] then
    table.insert(heads, { "<Esc>", nil, { exit = true, desc = false } })
  end
  if not seen_keys["<CR>"] then
    table.insert(heads, { "<CR>", nil, { exit = true, desc = false } })
  end
  
  return heads
end

-- Function to generate the hint funcs for Hydra based on the columns
function M.generate_funcs(columns)
  local funcs = {}
  for _, col in ipairs(columns) do
    for _, item in ipairs(col) do
      if item.toggle_func and item.toggle_check then
        funcs[item.toggle_func] = function()
          if item.toggle_check() then
            return "[✓]"
          else
            return "[ ]"
          end
        end
      end
    end
  end
  return funcs
end

return M
