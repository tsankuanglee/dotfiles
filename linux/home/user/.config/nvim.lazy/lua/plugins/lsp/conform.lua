return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local format_op_option = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    }
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },

        javascript = { "prettierd" },
        typescript = { "prettierd" },
        markdown = { "prettierd" },
        json = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        yaml = { "prettierd" },
      },
      -- format_on_save = format_op_option,
    })

    local km = require("utils").km -- keymap shortcut function
    km({ "n", "v" }, "<LEADER>lf", function() conform.format(format_op_option) end, "format file or range")
  end,
}
