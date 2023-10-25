-- Better Folding
-- use <TAB> to switch between main/preview window

-- There are two options: we can use LSP or treesitter as the provider
local provider = "LSP" -- or treesitter

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = ("  %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth) end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" }) -- "MoreMsg" is hiGroup
  return newVirtText
end

return {
  "kevinhwang91/nvim-ufo",
  event = "VeryLazy",
  dependencies = {
    "kevinhwang91/promise-async",
    "neovim/nvim-lspconfig",
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  },
  opts = {
    fold_virt_text_handler = handler,
  },
  config = function(_, opts)
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.opt.fillchars:append({
      eob = " ",
      fold = " ",
      foldopen = "",
      foldsep = " ",
      foldclose = "",
    })

    local ufo = require("ufo")
    -- There are two options: we can use LSP or treesitter as the provider
    if provider == "LSP" then
      -- option 2: nvim lsp as lsp client
      -- tell the server the capability of foldingrange,
      -- neovim hasn't added foldingrange to default capabilities, users must add it manually
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingrange = {
        dynamicregistration = false,
        linefoldingonly = true,
      }
      local language_servers = lspconfig.util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        lspconfig[ls].setup({
          capabilities = capabilities,
          -- you can add other fields for setting up lsp server in this table
        })
      end
      ufo.setup(opts)
    else
      -- Option 3: treesitter as a main provider instead
      -- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
      -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
      opts["provider_selector"] = function(_, _, _) return { "treesitter", "indent" } end
      ufo.setup(opts)
    end

    vim.cmd([[
        hi Folded        guibg=#101010
        hi CursorLine    guibg=#1A1A1A
        hi MoreMsg       guibg=#3A3A3A guifg=#C0C0C0
      ]])

    local km = require("utils").km -- keymap shortcut function
    km("n", "zR", ufo.openAllFolds, "ufo (fold): open all")
    km("n", "zM", ufo.closeAllFolds, "ufo (fold) close all")
    km("n", "zP", function()
      local winid = ufo.peekFoldedLinesUnderCursor()
      if not winid and provider == "LSP" then vim.lsp.buf.hover() end
    end, "ufo (fold): preview")
  end,
}
