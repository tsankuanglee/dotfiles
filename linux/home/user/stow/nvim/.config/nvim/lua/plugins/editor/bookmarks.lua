-- LintaoAmons/bookmarks.nvim
-- https://github.com/LintaoAmons/bookmarks.nvim
-- Bookmark manager
return {
  keys = {
    { "m<Space>", "<cmd>BookmarksMark<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Mark current line." },
    { "m<Cr>", "<cmd>BookmarksGoto<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Go to (select)" },
    { "m<Del>", function() require("bookmarks.commands").delete_mark_of_current_file() end, mode = { "n", "v" }, desc = "delete marks of current file" },
    { "m<Bslash>", "<cmd>BookmarksCommands<cr>", mode = { "n", "v" }, desc = "[Bookmarks] command" },
    { "m<Up>", "<cmd>BookmarksGotoPrev<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Go to previous (by line number)" },
    { "m<Down>", "<cmd>BookmarksGotoNext<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Go to next (by line number)" },
    { "m<S-Up>", "<cmd>BookmarksGotoPrev<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Go to previous (by id)" },
    { "m<S-Down>", "<cmd>BookmarksGotoNext<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Go to next (by id)" },
    { "<LEADER>B:", "<cmd>BookmarksCommands<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Command" },
    { "<LEADER>Bm", "<cmd>BookmarksMark<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Mark/toggle current line" },
    { "<LEADER>Bd", function() require("bookmarks.commands").delete_mark_of_current_file() end, mode = { "n", "v" }, desc = "[Bookmarks] delete marks in current file" },
    { "<LEADER>BA", "<cmd>BookmarkRebindOrphanNode<cr>", mode = { "n", "v" }, desc = "[Bookmarks] reAttach to root node" },
    { "<LEADER>Bg", "<cmd>BookmarksGoto<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Go to (select)" },
    { "<LEADER>Bn", "<cmd>BookmarksGotoNext<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Go to next (by line number)" },
    { "<LEADER>Bp", "<cmd>BookmarksGotoPrev<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Go to previous (by line number)" },
    { "<LEADER>BN", "<cmd>BookmarksGotoNextInList<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Go to next (by id)" },
    { "<LEADER>BP", "<cmd>BookmarksGotoPrevInList<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Go to previous (by id)" },
    { "<LEADER>BT", "<cmd>BookmarksTree<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Tree view" },
    { "<LEADER>Bl<Cr>", "<cmd>BookmarksLists<cr>", mode = { "n", "v" }, desc = "[Bookmarks] pick a List" },
    { "<LEADER>Bln", "<cmd>BookmarksNewList<cr>", mode = { "n", "v" }, desc = "[Bookmarks] create a New list" },
    { "<LEADER>Blf", function() require("bookmarks.commands").current_file_bookmarks_to_new_list() end, mode = { "n", "v" }, desc = "[Bookmarks] current File bookmarks to new list" },
    { "<LEADER>BX", function() require("bookmarks.commands").mix_active_bookmark() end, mode = { "n", "v" }, desc = "[Bookmarks] miX active bookmark into XML" },
    --     { "<LEADER>BM", function() require("bookmarks.commands").mark_selected_files() end, mode = { "n", "v" }, desc = "[Bookmarks] Mark selected files" },
    { "<LEADER>BLl", function() require("bookmarks.commands")["Link bookmark"]() end, mode = { "n", "v" }, desc = "[Bookmarks] Link bookmark" },
    { "<LEADER>BLo", function() require("bookmarks.commands")["Goto linked out bookmarks"]() end, mode = { "n", "v" }, desc = "[Bookmarks] goto Linked out bookmarks" },
    { "<LEADER>BLi", function() require("bookmarks.commands")["Goto linked in bookmarks"]() end, mode = { "n", "v" }, desc = "[Bookmarks] goto Linked in bookmarks" },
    { "<LEADER>BLm", function() require("bookmarks.commands")["Mark and link to existing bookmark"]() end, mode = { "n", "v" }, desc = "[Bookmarks] mark and link to existing bookmark" },
    { "<LEADER>BG", "<cmd>BookmarksGrep<cr>", mode = { "n", "v" }, desc = "[Bookmarks] Grep through bookmarked files" },
    { "<LEADER>Ba", "<cmd>BookmarksDesc<cr>", mode = { "n", "v" }, desc = "[Bookmarks] add description" },
    { "<LEADER>BI", "<cmd>BookmarksInfo<cr>", mode = { "n", "v" }, desc = "[Bookmarks] plugin current Info" },
    { "<LEADER>Bi", "<cmd>BookmarksInfoCurrentBookmark<cr>", mode = { "n", "v" }, desc = "[Bookmarks] current bookmark Info" },
  },
  "LintaoAmons/bookmarks.nvim",
  -- pin the plugin at specific version for stability
  -- backup your bookmark sqlite db when there are breaking changes (major version change)
  tag = "3.2.0",
  dependencies = {
    {"kkharji/sqlite.lua"},
    {"nvim-telescope/telescope.nvim"},  -- currently has only telescopes supported, but PRs for other pickers are welcome 
    {"stevearc/dressing.nvim"}, -- optional: better UI
    -- {"GeorgesAlkhouri/nvim-aider"} -- optional: for Aider integration
  },
  config = function()
    local opts = {
      -- check the "./lua/bookmarks/default-config.lua" file for all the options
    }
    require("bookmarks").setup(opts) -- you must call setup to init sqlite db

    --
    -- redundant mappings for convvenient


    -- normal settings



    -- navigation

    -- Tree view 
    -- see the following for default Tree view shortcuts
    --   https://github.com/LintaoAmons/bookmarks.nvim/blob/main/lua/bookmarks/default-config.lua
    -- cheat sheet
    --   q)uit/ESC
    --   R)efresh
    --   a)dd list
    --   u)p level
    --   .) set root
    --   m)ain: set current as Main list
    --
    --   o)pen (list or location)
    --   g)oto
    --   <LOCALLEADER>j / k : move node down/up
    --
    --   D)elete
    --   r)ename
    --
    --   x)cut
    --   c)opy
    --   p)aste
    --
    --   i)nfo
    --   t)oggle reverse
    --   P)review
    --
    --   +) add to aider
    --   j) drop from aider
    --   =) add to aider, read-only
    --
    --   ?) show help (doesn't work?)
    --

    -- lists


    -- Links

    -- info


  end,
}
