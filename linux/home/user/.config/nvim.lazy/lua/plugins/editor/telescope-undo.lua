return {
  "debugloop/telescope-undo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        undo = {
          -- telescope-undo.nvim config
          use_delta = true,

          side_by_side = true,
          layout_strategy = "vertical",
          layout_config = {
            preview_height = 0.8,
          },
          -- these are the defaults
          --[[ mappings = {
            i = {
              ["<cr>"] = function(bufnr) require("telescope-undo.actions").yank_additions(bufnr) end,
              -- ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
              ["<C-cr>"] = function(bufnr) require("telescope-undo.actions").restore(bufnr) end,
              -- alternative defaults, for users whose terminals do questionable things with modified <cr>
              ["<C-y>"] = function(bufnr) require("telescope-undo.actions").yank_deletions(bufnr) end,
              -- ["<C-r>"] = require("telescope-undo.actions").restore,
            },
            n = {
              ["y"] = function(bufnr) require("telescope-undo.actions").yank_additions(bufnr) end,
              ["Y"] = function(bufnr) require("telescope-undo.actions").yank_deletions(bufnr) end,
              ["u"] = function(bufnr) require("telescope-undo.actions").restore(bufnr) end,
            },
          }, ]]
        },
      },
    })
    require("telescope").load_extension("undo")
    local km = require("utils").km -- keymap shortcut function
    km("n", "<LEADER>u", "<CMD>Telescope undo<CR>", "Telescope Undo")
  end,
}

