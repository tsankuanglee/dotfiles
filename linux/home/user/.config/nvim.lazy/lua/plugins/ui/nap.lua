-- nap: next and previous; a cleaner version of vim unimpaired
return {
  "liangxianzhe/nap.nvim",
  lazy = false,
  config = function()
    local nap = require("nap")
    -- The provided implementation falls back to ]c [c in diff mode.
    nap.setup({
      next_prefix = "]",
      prev_prefix = "[",
      next_repeat = "<c-n>",
      prev_repeat = "<c-p>",
    })
    -- To remove a default operator
    --nap.map("a", false)
    -- overwrite
    nap.map("c", nap.gitsigns())
  end,
}
