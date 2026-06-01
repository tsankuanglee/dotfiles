-- lewis6991/gitsigns.nvim
-- https://github.com/lewis6991/gitsigns.nvim
-- Git integration for buffers
--
-- git decorations
return {
  keys = {
    { "<LEADER>Gcn", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() require("gitsigns").next_hunk() end)
          return "<Ignore>"
        end, mode = "n", desc = "Gitsigns jump to next change" },
    { "<LEADER>Gcp", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() require("gitsigns").prev_hunk() end)
          return "<Ignore>"
        end, mode = "n", desc = "Gitsigns jump to previous change" },
    { "<LEADER>Gs", require("gitsigns").stage_hunk, mode = "n", desc = "Gitsigns stage_hunk" },
    { "<LEADER>Gr", require("gitsigns").reset_hunk, mode = "n", desc = "Gitsigns reset_hunk" },
    { "<LEADER>Gs", function() require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, mode = "v", desc = "Gitsigns stage_hunk" },
    { "<LEADER>Gr", function() require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, mode = "v", desc = "Gitsigns reset_hunk" },
    { "<LEADER>GS", require("gitsigns").stage_buffer, mode = "n", desc = "Gitsigns stage_buffer" },
    { "<LEADER>Gu", require("gitsigns").undo_stage_hunk, mode = "n", desc = "Gitsigns undo stage_buffer" },
    { "<LEADER>GR", require("gitsigns").reset_buffer, mode = "n", desc = "Gitsigns reset_" },
    { "<LEADER>Gp", require("gitsigns").preview_hunk, mode = "n", desc = "Gitsigns preview_hunk" },
    { "<LEADER>Gb", function() require("gitsigns").blame_line({ full = true }) end, mode = "n", desc = "Gitsigns blame_line" },
    { "<LEADER>Gtb", require("gitsigns").toggle_current_line_blame, mode = "n", desc = "Gitsigns toggle_current_line_blame" },
    { "<LEADER>Gd", require("gitsigns").diffthis, mode = "n", desc = "Gitsigns diffthis" },
    { "<LEADER>GD", function() require("gitsigns").diffthis("~") end, mode = "n", desc = "Gitsigns diffthis(\"~\")" },
    { "<LEADER>Gtd", require("gitsigns").toggle_deleted, mode = "n", desc = "Gitsigns toggle_deleted" },
    { "ih", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" }, desc = "Gitsigns select_hunk" },
  },
  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- Navigation


        -- Actions

        -- Text object
      end,
    })
  end,
}
