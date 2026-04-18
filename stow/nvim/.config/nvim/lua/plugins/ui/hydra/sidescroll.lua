-- side scrools: zh zl zH zL
return {
  setup = function()
    local Hydra = require("hydra")
    Hydra({
      name = "Side scroll",
      mode = "n",
      body = "z",
      config = {
        timeout = 500,
      },
      heads = {
        { "h", "3zh" },
        { "l", "3zl", { desc = "←/→" } },
        { "H", "zH" },
        { "L", "zL", { desc = "half screen ←/→" } },
      },
    })
  end,
}
