if vim.g.neovide then
  -- see https://neovide.dev/configuration.html
  vim.o.guifont = "Hack Nerd Font Mono:h20"

  vim.g.neovide_transparency = 0.88
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  vim.g.neovide_scroll_animation_length = 0.0
  vim.g.neovide_cursor_animation_length = 0.0
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true

  vim.g.neovide_remember_window_size = true

  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta) vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta end
  vim.keymap.set("n", "<C-=>", function() change_scale_factor(1.2) end)
  vim.keymap.set("n", "<C-->", function() change_scale_factor(1 / 1.2) end)
end

-- vim.lsp.set_log_level("TRACE")

if vim.g.vscode then
    -- VSCode extension
else
  require("utils")

  require("config.options")
  require("config.keymaps")

  require("config.lazy")

  require("config.autocmds")
end
