return {
  "stevearc/dressing.nvim",
  opts = {},
  config = function()
    local dressing = require("dressing")
    dressing.setup({
      input = {
        enabled = true,
      },
      select = {
        enabled = true,
        backend = { "fzf_lua", "telescope", "fzf", "builtin", "nui" },
      },
    })
  end,
}
