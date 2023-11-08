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
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<LEADER>ff", builtin.find_files, {})
    vim.keymap.set("n", "<LEADER>fg", builtin.live_grep, {})
    vim.keymap.set("n", "<LEADER>fb", builtin.buffers, {})
    vim.keymap.set("n", "<LEADER>fh", builtin.help_tags, {})
  end,
}
