-- uga-rosa/ccc.nvim
-- https://github.com/uga-rosa/ccc.nvim
-- Color picker and highlighter
--
--[[
# Create Color Code (color picker)

* j/k: down/up
* <CR>: complete
* q: quit
* i/o: toggle input/output mode
* r: reset
* a: alpha
* g: toggle previous colors
* w/W/b/B: jump to previous colors

* l/h, d/s, ,/m: +-1,5,10
* H/M/L: 0/50/100%
* 1-9: 10-90%
]]
return {
  keys = {
    { "<LEADER><c-k>", "<CMD>CccPick<CR>", mode = "n", desc = "CCC color picker" },
  },
  "uga-rosa/ccc.nvim",
  lazy=false,
  config = function()
    vim.opt.termguicolors = true
    local ccc = require("ccc")
    local mapping = ccc.mapping

    ccc.setup({
      -- Your preferred settings
      -- Example: enable highlighter
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    })



  end

}
