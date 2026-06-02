-- Usage:
-- Run this script headlessly from the repository root to generate keybinds.md:
-- nvim --headless -c "luafile scripts/generate_keybinds.lua" -c "q"

local file = io.open("keybinds.md", "w")
file:write("# Neovim Keybindings\n\n")

local modes = {
  n = "Normal",
  v = "Visual",
  i = "Insert",
  c = "Command",
}

for mode, mode_name in pairs(modes) do
  file:write("## " .. mode_name .. " Mode\n\n")
  file:write("| Key | Action / Description |\n")
  file:write("|-----|----------------------|\n")
  local maps = vim.api.nvim_get_keymap(mode)
  for _, map in ipairs(maps) do
    local lhs = map.lhs:gsub("|", "\\|")
    -- Format literal leading spaces as <Space> to fix Markdown rendering
    if lhs:sub(1, 1) == " " then
      lhs = "<Space>" .. lhs:sub(2)
    end
    
    local desc = map.desc or map.rhs or ""
    desc = desc:gsub("\n", " "):gsub("|", "\\|")
    
    if desc == "" and type(map.callback) == "function" then
      desc = "Lua Function"
    end
    
    file:write(string.format("| `%s` | %s |\n", lhs, desc))
  end
  file:write("\n")
end

file:close()
print("Successfully generated keybinds.md")
