
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
      config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
    },
  },

  --[[ config = function()
    local ls = require("luasnip")

    local km = require("utils").km -- keymap shortcut function
    km({ "i" }, "<C-L><C-L>", function() ls.expand() end, "expand snip")
    km({ "i", "s" }, "<C-L><C-J>", function() ls.jump(1) end, "jump next")
    km({ "i", "s" }, "<C-L><C-K>", function() ls.jump(-1) end, "jump previous")
    km({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then ls.change_choice(1) end
    end, "luasnip: end choice")
  end, ]]
}
