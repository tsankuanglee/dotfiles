-- top bar line
local reset_barbar_hi = function()
  -- " vim.api.nvim_set_hl(0, "BufferCurrent", { underline = true })
  vim.cmd([[
    highlight BufferVisible guifg=#c0caf5 guibg=#16161e
    highlight BufferCurrent guifg=#ffffff guibg=#000000 gui=bold
    "highlight BufferCurrent guifg=#ffffff guibg=#000000 gui=bold,underline
  ]])
end

return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",     -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    -- version = '^1.0.0', -- optional: only update when a new 1.x version is released

    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- if g.barbar_auto_setup, lazy.nvim automatically calls setup with options here
      -- Don't use this. Directly set it up below in bb.setup
    },
    config = function(_, _)
      local bb = require("barbar")

      -- change highlight and register autocmd for colorscheme change
      require("utils").run_and_register_highlight_change(
        "barbar",
        function()
          vim.cmd([[
            highlight BufferVisible guifg=#c0caf5 guibg=#16161e
            highlight BufferCurrent guifg=#ffffff guibg=#000000 gui=bold
            "highlight BufferCurrent guifg=#ffffff guibg=#000000 gui=bold,underline
          ]])
        end
      )

      bb.setup({
        -- anything missing will use the default:
        highlight_visible = true,
        -- Enable/disable current/total tabpages indicator (top right corner)
        tabpages = true,
        icons = {
          -- Configure the base icons on the bufferline.
          -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
          buffer_index = false,
          buffer_number = false,
          button = "",
          --
          -- Enables / disables diagnostic symbols
          diagnostics = {
            [vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
            [vim.diagnostic.severity.WARN] = { enabled = false },
            [vim.diagnostic.severity.INFO] = { enabled = false },
            [vim.diagnostic.severity.HINT] = { enabled = true },
          },
          gitsigns = {
            added = { enabled = true, icon = "+" },
            changed = { enabled = true, icon = "~" },
            deleted = { enabled = true, icon = "-" },
          },
          filetype = {
            -- Sets the icon's highlight group.
            -- If false, will use nvim-web-devicons colors
            custom_colors = false,

            -- Requires `nvim-web-devicons` if `true`
            enabled = true,
          },
          separator = { left = "▎", right = "" },

          -- If true, add an additional separator at the end of the buffer list
          separator_at_end = true,

          -- Configure the icons on the bufferline when modified or pinned.
          -- Supports all the base icon options.
          modified = { button = "●" },
          pinned = { button = "", filename = true },

          -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
          preset = "default",

          -- Configure the icons on the bufferline based on the visibility of a buffer.
          -- Supports all the base icon options, plus `modified` and `pinned`.
          alternate = { filetype = { enabled = false } },
          current = { buffer_index = false },
          inactive = { button = "×" },
          visible = { modified = { buffer_number = false } },
        },
      })
      reset_barbar_hi()
    end,
  },
}
