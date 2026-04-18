-- nap: next and previous; a cleaner version of vim unimpaired
return {
  "liangxianzhe/nap.nvim",
  lazy = true,
  event = { "VeryLazy" },
  config = function()
    local nap = require("nap")
    -- The provided implementation falls back to ]c [c in diff mode.
    nap.setup({
      next_prefix = "]",
      prev_prefix = "[",
      next_repeat = "<c-n>",
      prev_repeat = "<c-p>",
      exclude_default_operators = {
        "a",
        "A",
        "b",
        "B",
      },
    })
    -- To remove a default operator
    --nap.map("a", false)

    -- overwrite with external tools
    nap.map("c", nap.gitsigns())
    nap.map("o", nap.aerial())
    nap.map("r", nap.illuminate())
  end,
}
