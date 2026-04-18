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

    local km = require("utils").km -- keymap shortcut function
    km("n", "<LEADER><c-k>", "<CMD>CccPick<CR>", "CCC color picker")


  end

}
