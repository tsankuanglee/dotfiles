-- L3MON4D3/LuaSnip
-- https://github.com/L3MON4D3/LuaSnip
-- Snippet Engine
return {
  keys = {
    { "<C-K>", function() require("luasnip").expand() end, mode = { "i" }, desc = "expand snip" },
    { "<C-L>", function() require("luasnip").jump(1) end, mode = { "i", "s" }, desc = "jump next" },
    { "<C-J>", function() require("luasnip").jump(-1) end, mode = { "i", "s" }, desc = "jump previous" },
  },
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
  end,
}
