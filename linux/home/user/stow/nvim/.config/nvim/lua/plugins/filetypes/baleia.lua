-- m00qek/baleia.nvim
-- https://github.com/m00qek/baleia.nvim
-- Colorize text with ANSI escape sequences
return {
  keys = {
    { "<LOCALLEADER>C", "<CMD>BaleiaColorize<CR>", mode = "n", desc = "Colorize ANSI text" },
  },
  "m00qek/baleia.nvim",
  -- version = "*",  -- stick with major release
  config = function()
    vim.g.baleia = require("baleia").setup({ })

    -- Command to colorize the current buffer
    vim.api.nvim_create_user_command("BaleiaColorize", function()
      vim.g.baleia.once(vim.api.nvim_get_current_buf())
    end, { bang = true })

    -- Command to show logs 
    vim.api.nvim_create_user_command("BaleiaLogs", vim.cmd.messages, { bang = true })
    
    -- Keyboard shortcuts
  end,
}
