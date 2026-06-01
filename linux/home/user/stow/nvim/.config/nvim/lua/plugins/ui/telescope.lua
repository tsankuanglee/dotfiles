-- nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope.nvim
-- Find, Filter, Preview, Pick
--
-- extendable fuzzy finder over lists
return {
  keys = {
    { "<LEADER>ff", function() require("telescope.builtin").find_files() end, mode = "n", desc = "[Telescope] find_files" },
    { "<LEADER>fg", function() require("telescope.builtin").live_grep() end, mode = "n", desc = "[Telescope] live_grep" },
    { "<LEADER>fb", function() require("telescope.builtin").buffers() end, mode = "n", desc = "[Telescope] buffers" },
    { "<LEADER>fh", function() require("telescope.builtin").help_tags() end, mode = "n", desc = "[Telescope] help_tags" },
    { "<LEADER>fa", "<CMD>Telescope aerial<CR>", mode = "n", desc = "[Telescope] aerial" },
  },
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  -- branch = '0.1.x',
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
    })

    telescope.load_extension("aerial")

    local builtin = require("telescope.builtin")
  end,
}
