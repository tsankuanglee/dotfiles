return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  config = function()
    local conform = require("conform")
    local format_op_option = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    }

    -- local slow_format_filetypes = {}

    conform.setup({
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        java = { "google-java-format" },
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt" },

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
