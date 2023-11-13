-- A replacement for :mksession with a better API
return {
  "stevearc/resession.nvim",
  opts = {},
  config = function()
    local resession = require("resession")
    resession.setup()
    -- Resession does NOTHING automagically, so we have to set up some keymaps
    local km = require("utils").km -- keymap shortcut function
    km("n", "<leader>ss", resession.save, "[reSession save]")
    km("n", "<leader>st", resession.save_tab, "[reSession save_tab]")
    km("n", "<leader>sl", resession.load, "[reSession load]")
    km("n", "<leader>sd", resession.delete, "[reSession delete]")
  end,
}
