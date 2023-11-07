-- Smooth scrolling for ANY movement command
-- provides a sense of movement direction
return {
  "declancm/cinnamon.nvim",
  enabled = true,
  config = function()
    require("cinnamon").setup({
      -- disabled = false,
      default_keymaps = true, -- Create default keymaps.
      extra_keymaps = true, -- Create extra keymaps.
      extended_keymaps = true,
      override_keymaps = false, -- The plugin keymaps will override any existing keymaps.

      default_delay = 2,
      max_length = 20,
    })
  end,
}
