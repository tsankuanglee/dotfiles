--[[
jump to open/close semantically with %

* % motion to language-specific words, e.g. if then else
* g% : reverse movement
* [% : go to [count]th previous outer open word
* ]% : go to [count]th next surrounding close word
* z% : go to inside [count]th nearest inner contained block

text objects: i% a%
* i% the inside of an any block
* 1i% the inside of an open-to-close block
* {count}i% If count is greater than 1, the inside of the {count}th surrounding open-to-close block
* a% an any block.
* 1a% an open-to-close block. Includes mids but does not include open and close words.
* {count}a% if {count} is greater than 1, the {count}th surrounding open-to-close block.

]]
return {
  "andymass/vim-matchup",
  branch = "master",
  enabled = "true",
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
    -- other parts of the setting is in treesitter.lua
  end,
}
