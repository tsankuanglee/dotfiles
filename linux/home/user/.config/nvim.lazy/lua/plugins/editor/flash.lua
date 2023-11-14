--[[
add target label for jumping
TODO how to use the remote mode?
--]]
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      search = {
        enabled = false, -- default off for nvim search; use hotkey to toggle
      },
      -- for ftFT
      char = {
        jump_labels = true,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<LOCALLEADER>/", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "[Flash] search (wrap)" },
    { "<LOCALLEADER>t", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "[Flash] Treesitter" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "<C-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "[Flash] Toggle Flash during / ? search" },
    { "<C-s>", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "[Flash] Treesitter search" },
    {
      "<C-s>", mode = { "n" },
      function() require("flash").jump({ pattern = vim.fn.expand("<cword>") }) end,
      desc = "Flash Search the word under cursor",
    },
  },
}
