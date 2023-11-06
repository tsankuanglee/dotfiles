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
        enabled = false, -- default off; use <c-s> to toggle
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "r",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<C-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },

    { "<LEADER>*", mode = { "n" }, function()
        require("flash").jump({ pattern = vim.fn.expand("<cword>") })
      end, desc = "Flash Search the word under cursor"
    },
  },
}
