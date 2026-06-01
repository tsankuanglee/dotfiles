-- stevearc/resession.nvim
-- https://github.com/stevearc/resession.nvim
-- Save/restore nvim sessions
-- A replacement for :mksession with a better API
return {
  keys = {
    { "<leader>ss", function() require("resession").save() end, mode = "n", desc = "[reSession save]" },
    { "<leader>sa", function()
      require("resession").detach()
      require("resession").save()
    end, mode = "n", desc = "[reSession save as]" },
    { "<leader>st", function() require("resession").save_tab() end, mode = "n", desc = "[reSession save_tab]" },
    { "<leader>sl", function() require("resession").load() end, mode = "n", desc = "[reSession load]" },
    { "<leader>sd", function() require("resession").delete() end, mode = "n", desc = "[reSession delete]" },
    { "<leader>sD", function() require("resession").detach() end, mode = "n", desc = "[reSession Detach current]" },
  },
  "stevearc/resession.nvim",
  opts = {},
  config = function()
    local resession = require("resession")
    resession.setup()
    -- Resession does NOTHING automagically, so we have to set up some keymaps
  end,
}
