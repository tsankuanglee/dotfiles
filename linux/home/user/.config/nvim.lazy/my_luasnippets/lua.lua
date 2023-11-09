local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("nvim lazy config", {
    t"-- ", i(1, "summary of plugin"), t({"",""}),
    t{"return {", ""},
    t"  \"", i(2, "pluginAddress"), t{"\",",""},
    t{"  config = function()", ""},
    t"    local ", i(3, "pluginName"), t" = require(\"", i(4, "moduleName"), t{"\")", ""},
    t"    ", i(0),
    t({"",""}),
    t{"  end", ""},
    t{"}", ""},
  }),

  s("luasnip imports", {
    t{
      'local ls = require("luasnip")',
      '',
      'local s = ls.snippet',
      'local sn = ls.snippet_node',
      'local t = ls.text_node',
      'local i = ls.insert_node',
      'local f = ls.function_node',
      '',
    }
  }),

}


