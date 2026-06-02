-- side scrools: zh zl zH zL
local M = {}
M.setup = function()
    local Hydra = require("hydra")
    local builder = require("plugins.ui.hydra.hydra-builder")

    local scroll_col = {
      { key = "h", action = "3zh", desc = "←", exit = false },
      { key = "l", action = "3zl", desc = "→", exit = false },
      { key = "H", action = "zH", desc = "half screen ←", exit = false },
      { key = "L", action = "zL", desc = "half screen →", exit = false },
    }

    M.hydra = Hydra({
      name = "Side scroll",
      mode = "n",
      body = "z",
      hint = builder.generate_hint("Side Scroll", { scroll_col }),
      config = {
        timeout = 500,
      },
      heads = builder.generate_heads({ scroll_col }),
    })
  end

M.activate = function()
  if M.hydra then M.hydra:activate() end
end

return M
