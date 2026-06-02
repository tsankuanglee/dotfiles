local M = {}

M.setup = function()
  local Hydra = require("hydra")
  local builder = require("plugins.ui.hydra.hydra-builder")

  local main_col = {
    { title = "Modules", hl = "Title" },
    { key = "a", action = function() require("plugins.ui.hydra.action-apps").activate() end, desc = "Actions & Apps", exit = true },
    { key = "b", action = function() require("plugins.ui.hydra.buffer").activate() end, desc = "Buffer Management", exit = true },
    { key = "o", action = function() require("plugins.ui.hydra.options").activate() end, desc = "Options Toggle", exit = true },
    { key = "s", action = function() require("plugins.ui.hydra.sidescroll").activate() end, desc = "Side Scroll", exit = true },
    { key = "w", action = function() require("plugins.ui.hydra.window").activate() end, desc = "Window Management", exit = true },
  }

  M.hydra = Hydra({
    name = "Main Menu",
    hint = builder.generate_hint("Hydra Main Menu", { main_col }, { hide_back = true }),
    config = {
      color = "teal",
      invoke_on_body = true,
      hint = { position = "middle" },
      exit = true,
    },
    mode = "n",
    body = "<LEADER>h",
    heads = builder.generate_heads({ main_col }, { hide_back = true }),
  })
end

M.activate = function()
  if M.hydra then M.hydra:activate() end
end

return M
