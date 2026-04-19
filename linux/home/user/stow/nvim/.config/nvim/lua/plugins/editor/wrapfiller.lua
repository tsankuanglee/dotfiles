-- wrapfillter: align wrapped lines in diff
-- g:WrapFiller, t:WrapFiller : Enable/disable (1/0) global/tab wrapfiller
-- default is disabled since when other plugins, such as Bookmarks, opens a window,
-- this plugin will try to incorrectly align the lines
return {
  'rickhowe/wrapfiller',
  event = "BufRead",
  config = function()
    -- disable it by default
    vim.g.WrapFiller = 0
  end,
}
