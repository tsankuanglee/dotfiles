--[[ Syntax aware text-objects, select, move, swap, and peek support.
various programmly semantic objects (funcitons, parameters, etc.)
https://github.com/nvim-treesitter/nvim-treesitter-textobjects
]]
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = { "BufReadPost", "BufNewFile" },
  lazy = true,
  priority = 400,
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
          },

          -- these keys follow v,V,C-v above
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["aa"] = { query = "@parameter.outer", desc = "select argument outer" },
            ["ia"] = { query = "@parameter.inner", desc = "select argument inner" },
            ["ab"] = { query = "@block.outer", desc = "select block outer" },
            ["ib"] = { query = "@block.inner", desc = "select block inner" },
            ["am"] = { query = "@function.outer", desc = "select method outer" },
            ["im"] = { query = "@function.inner", desc = "select method inner" },
            ["aC"] = "@class.outer",
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ["iC"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            ["i?"] = { query = "@conditional.inner"},
            ["a?"] = { query = "@conditional.outer"},
            ["il"] = { query = "@loop.inner"},
            ["al"] = { query = "@loop.outer"},
            ["iT"] = { query = "@comment.inner", desc = "Select commenT inner"},
            ["aT"] = { query = "@comment.outer", desc = "Select commenT outer"},

            -- You can also use captures from other query groups like `locals.scm`
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true of false
          include_surrounding_whitespace = false,
        },
        swap = {
          enable = true,
          swap_previous = {
            ["<leader>[a"] = { query = "@parameter.inner", desc = "swap w/ previous argument" },
            ["<leader>[b"] = "@block.outer",
            ["<leader>[m"] = { query = "@function.outer", desc = "swap w/ previous method" },
            ["<leader>[C"] = "@class.outer",
          },
          swap_next = {
            ["<leader>]a"] = { query = "@parameter.inner", desc = "swap w/ next argument" },
            ["<leader>]b"] = "@block.outer",
            ["<leader>]m"] = { query = "@function.outer", desc = "swap w/ next method" },
            ["<leader>]C"] = "@class.outer",
          },
        },
        move = { -- movement
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]a"] = { query = "@parameter.outer", desc = "Next argument start" },
            ["]b"] = "@block.outer",
            ["]m"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]]"] = { query = "@class.outer", desc = "Next class start" },
            ["]?"] = "@conditional.outer",
            --
            -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
            ["]l"] = "@loop.*",
            -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
            ["]T"] = {query = "@comment.inner", desc = "Next commenT start"},

            -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
            -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
            -- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]B"] = "@block.outer",
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[a"] = { query = "@parameter.outer", desc = "Previous argument start" },
            ["[b"] = "@block.outer",
            ["[m"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[["] = { query = "@class.outer", desc = "Previous class start" },
            ["[?"] = "@conditional.outer",
            ["[l"] = "@loop.*",
            ["[T"] = {query = "@comment.inner", desc = "Previous commenT start"},

            -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
          },
          goto_previous_end = {
            ["[B"] = "@block.outer",
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
          -- Below will go to either the start or the end, whichever is closer.
          -- Use if you want more granular movements
          -- Make it even more gradual by adding multiple queries and regex.
          -- goto_next = {
          --   ["]?"] = "@conditional.outer",
          -- },
          -- goto_previous = {
          --   ["[?"] = "@conditional.outer",
          -- },
        },
      },
    })

    -- Repeat movement with ; and , (; and , clash with nvim-flash; use C-j and C-k instead
    local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
    -- ensure ; goes forward and , goes backward regardless of the last direction
    vim.keymap.set({ "n", "x", "o" }, "<C-j>", ts_repeat_move.repeat_last_move_next)
    vim.keymap.set({ "n", "x", "o" }, "<C-k>", ts_repeat_move.repeat_last_move_previous)
  end,
}
