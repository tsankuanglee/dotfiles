return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  lazy = true,

  dependencies = {
    { "saadparwaiz1/cmp_luasnip", lazy = true }, -- luasnip completion source for nvim-cmp
    {
      -- tons of common snippets
      "rafamadriz/friendly-snippets",
      lazy = true,
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },

  config = function()
    local ls = require("luasnip")

    local km = require("utils").km -- keymap shortcut function
    km({ "i" }, "<LEADER><C-K>", function() ls.expand() end, "expand snip")
    km({ "i", "s" }, "<LEADER><C-L>", function() ls.jump(1) end, "jump next")
    km({ "i", "s" }, "<LEADER><C-J>", function() ls.jump(-1) end, "jump previous")

    vim.keymap.set({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
  end,
}
