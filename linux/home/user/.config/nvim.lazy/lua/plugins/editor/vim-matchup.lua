--[[
jump to open/close semantically

* % motion to language-specific words
* g% : reverse movement
* [% : go to [count]th previous outer open word
* ]% : go to [count]th next surrounding close word
* z% : go to inside [count]th nearest inner contained block

text objects: i% a%

]]
return {
  "andymass/vim-matchup",
  branch = "master",
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
