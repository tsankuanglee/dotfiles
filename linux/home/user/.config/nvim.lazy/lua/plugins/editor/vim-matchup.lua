-- jump to open/close semantically
return {
  "andymass/vim-matchup",
  branch = "master",
  config = function()
    -- may set any options here
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end
}
