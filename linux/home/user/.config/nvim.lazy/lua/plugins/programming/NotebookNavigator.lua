-- send NotbookCell to code runner
return {
  "GCBallesteros/NotebookNavigator.nvim",
  keys = {
    -- { "<F9>", function() require("notebook-navigator").move_cell("u") end, desc = "jump to previous NB cell" },
    -- { "<F10>", function() require("notebook-navigator").move_cell("d") end, desc = "jump to next NB cell" },
    -- { "<F8>", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
    -- { "<F7>", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
  },
  dependencies = {
    --"hkupty/iron.nvim", -- repl provider
    "akinsho/toggleterm.nvim", -- alternative repl provider
    "anuvyklack/hydra.nvim",
  },
  opts = function()
    local nn = require("notebook-navigator")

    local opts = { custom_textobjects = { h = nn.miniai_spec } }
    return opts
  end,
  event = "VeryLazy",
  config = function()
    local nn = require("notebook-navigator")
    nn.setup({
      activate_hydra_keys = "<LEADER>Nh",
      show_hydra_hint = false,

      -- hydra_keys = {
      --   comment = "c",
      --   run = "X",
      --   run_and_move = "x",
      --   move_up = "k",
      --   move_down = "j",
      --   add_cell_before = "a",
      --   add_cell_after = "b",
      -- },

      repl_provider = "auto", -- iron | toggleterm | auto
      cell_markers = {
        python = "# %%",
        lua = "-- %%",
        julia = "# %%",
        fennel = ";; %%",
        r = "# %%",
        matlab = "% %%",
      },
      -- Syntax based highlighting. If you don't want to install mini.hipattners or
      -- enjoy a more minimalistic look
      syntax_highlight = false,
      -- (Optional) for use with `mini.hipatterns` to highlight cell markers
      cell_highlight_group = "Folded",
    })
    local km = require("utils").km -- keymap shortcut function
    km("n", "<LEADER>Nt", "<CMD>ToggleTerm direction=vertical name=runner<CR>", "open Terminal runner")

  end,
}
