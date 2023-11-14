-- extendable fuzzy finder over lists
return {
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
    local km = require("utils").km -- keymap shortcut function
    km("n", "<LEADER>ff", builtin.find_files, "[Telescope] find_files")
    km("n", "<LEADER>fg", builtin.live_grep, "[Telescope] live_grep")
    km("n", "<LEADER>fb", builtin.buffers, "[Telescope] buffers")
    km("n", "<LEADER>fh", builtin.help_tags, "[Telescope] help_tags")
    km("n", "<LEADER>fa", "<CMD>Telescope aerial<CR>", "[Telescope] aerial")
  end,
}
