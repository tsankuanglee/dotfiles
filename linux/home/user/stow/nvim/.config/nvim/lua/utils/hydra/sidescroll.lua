-- side scrools: zh zl zH zL
return {
  setup = function()
    local Hydra = require("hydra")
    local builder = require("utils.hydra_builder")

    local scroll_col = {
      { key = "h", action = "3zh", desc = "←", exit = false },
      { key = "l", action = "3zl", desc = "→", exit = false },
      { key = "H", action = "zH", desc = "half screen ←", exit = false },
      { key = "L", action = "zL", desc = "half screen →", exit = false },
    }

    Hydra({
      name = "Side scroll",
      mode = "n",
      body = "z",
      hint = builder.generate_hint("Side Scroll", { scroll_col }),
      config = {
        timeout = 500,
      },
      heads = builder.generate_heads({ scroll_col }),
    })
  end,
}
