local hint = [[
  ^ ^ Actions
  ^
  _._ replace . with space

     _<Esc>_ _<CR>_
]]

local setup = function()
  local Hydra = require("hydra")
  local cmd = require("hydra.keymap-util").cmd
  Hydra({
    name = "Actions",
    hint = hint,
    config = {
      color = "blue",
      invoke_on_body = true,
      hint = {
        border = "rounded",
        position = "middle",
      },
      exit = true,
    },
    mode = { "n", "x" },
    body = "<LEADER>a",
    heads = {
      { ".", cmd("'<,'>s/\\./ /g"), { exit = true, desc = "replace . with space" }, },

      { "<Esc>", nil, { exit = true } },
      { "<CR>", nil, { exit = true } },
    },
  })
  -- code
end

return {
  setup = setup,
}

