-- git decorations
return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local km = require("utils").km -- keymap shortcut function

        -- Navigation
        km("n", "<LEADER>Gcn", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, "Gitsigns jump to next change", { expr = true })

        km("n", "<LEADER>Gcp", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, "Gitsigns jump to previous change", { expr = true })

        -- Actions
        km("n", "<LEADER>Gs", gs.stage_hunk, "Gitsigns stage_hunk")
        km("n", "<LEADER>Gr", gs.reset_hunk, "Gitsigns reset_hunk")
        km("v", "<LEADER>Gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Gitsigns stage_hunk")
        km("v", "<LEADER>Gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Gitsigns reset_hunk")
        km("n", "<LEADER>GS", gs.stage_buffer, "Gitsigns stage_buffer")
        km("n", "<LEADER>Gu", gs.undo_stage_hunk, "Gitsigns undo stage_buffer")
        km("n", "<LEADER>GR", gs.reset_buffer, "Gitsigns reset_")
        km("n", "<LEADER>Gp", gs.preview_hunk, "Gitsigns preview_hunk")
        km("n", "<LEADER>Gb", function() gs.blame_line({ full = true }) end, "Gitsigns blame_line")
        km("n", "<LEADER>Gtb", gs.toggle_current_line_blame, "Gitsigns toggle_current_line_blame")
        km("n", "<LEADER>Gd", gs.diffthis, "Gitsigns diffthis")
        km("n", "<LEADER>GD", function() gs.diffthis("~") end, "Gitsigns diffthis(\"~\")")
        km("n", "<LEADER>Gtd", gs.toggle_deleted, "Gitsigns toggle_deleted")

        -- Text object
        km({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select_hunk")
      end,
    })
  end,
}
