-- mfussenegger/nvim-lint
-- https://github.com/mfussenegger/nvim-lint
-- Asynchronous linter plugin
--
return {
  keys = {
    { "<LEADER>ll", function()
      require("lint").try_lint()
    end, mode = "n", desc = "lint for current file" },
    { "<LEADER>lL", function()
      vim.g.auto_lint = not vim.g.auto_lint
      vim.notify("Auto-linting is now " .. (vim.g.auto_lint and "enabled" or "disabled"))
    end, mode = "n", desc = "toggle auto Lint" },
  },
  "mfussenegger/nvim-lint",
  lazy = true,
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      lua = { "luacheck" },
      markdown = { "vale" },
      python = { "pylint" },
      typescript = { "eslint_d" },
    }

    -- Default to disabled
    vim.g.auto_lint = false

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      pattern = { "*.js", "*.lua", "*.md", "*.py", "*.ts" },
      group = lint_augroup,
      callback = function()
        if vim.g.auto_lint then
          lint.try_lint()
        end
      end,
    })

  end,
}

-- vim: ft=lua :
