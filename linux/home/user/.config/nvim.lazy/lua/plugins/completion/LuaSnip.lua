-- Snippet Engine for Neovim written in Lua
return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",                -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  build = "make install_jsregexp", -- install jsregexp (optional!).
  lazy = true,

  dependencies = {
    { "saadparwaiz1/cmp_luasnip", lazy = true }, -- luasnip completion source for nvim-cmp
    {
      -- tons of common programming snippets
      "rafamadriz/friendly-snippets",
      lazy = true,
      config = function()require("luasnip.loaders.from_vscode").lazy_load() end,
    },
  },

  config = function()
    local ls = require("luasnip")
    ls.config.set_config({
      -- history = true,  -- deprecated; equivalent to the following 3
      keep_roots = true,
      link_roots = true,
      link_children = true,

      enable_autosnippets = true,
    })
    -- custom snippets
    require("luasnip.loaders.from_lua").load({
      paths = {
        "./my_luasnippets",
        "./my_luasnippets_local",
      }
    })

    -- intergrated with nvim-cmp
    --[[ local km = require("utils").km -- keymap shortcut function
    km({ "i" }, "<C-K>", function() ls.expand() end, "expand snip")
    km({ "i", "s" }, "<C-L>", function() ls.jump(1) end, "jump next")
    km({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, "jump previous")
    km({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then ls.change_choice(1) end
    end, "luasnip: end choice") ]]
  end,
}
