-- bookmarks
--
return {
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

    local km = require("utils").km -- keymap shortcut function
    --
    -- redundant mappings for convvenient
    km({ "n", "v" }, "m<Space>", "<cmd>BookmarksMark<cr>", "[Bookmarks] Mark current line.")
    km({ "n", "v" }, "m<Cr>", "<cmd>BookmarksGoto<cr>", "[Bookmarks] Go to (select)")
    km({ "n", "v" }, "m<Del>", function() require("bookmarks.commands").delete_mark_of_current_file() end, "delete marks of current file")
    km({ "n", "v" }, "m<Bslash>", "<cmd>BookmarksCommands<cr>", "[Bookmarks] command")

    km({ "n", "v" }, "m<Up>", "<cmd>BookmarksGotoPrev<cr>", "[Bookmarks] Go to previous (by line number)")
    km({ "n", "v" }, "m<Down>", "<cmd>BookmarksGotoNext<cr>", "[Bookmarks] Go to next (by line number)")
    km({ "n", "v" }, "m<S-Up>", "<cmd>BookmarksGotoPrev<cr>", "[Bookmarks] Go to previous (by id)")
    km({ "n", "v" }, "m<S-Down>", "<cmd>BookmarksGotoNext<cr>", "[Bookmarks] Go to next (by id)")

    -- normal settings
    km({ "n", "v" }, "<LEADER>B:", "<cmd>BookmarksCommands<cr>", "[Bookmarks] Command")


    km({ "n", "v" }, "<LEADER>Bm", "<cmd>BookmarksMark<cr>", "[Bookmarks] Mark/toggle current line")
    km({ "n", "v" }, "<LEADER>Bd", function() require("bookmarks.commands").delete_mark_of_current_file() end, "[Bookmarks] delete marks in current file")
    km({ "n", "v" }, "<LEADER>BA", "<cmd>BookmarkRebindOrphanNode<cr>", "[Bookmarks] reAttach to root node")

    -- navigation
    km({ "n", "v" }, "<LEADER>Bg", "<cmd>BookmarksGoto<cr>", "[Bookmarks] Go to (select)")
    km({ "n", "v" }, "<LEADER>Bn", "<cmd>BookmarksGotoNext<cr>", "[Bookmarks] Go to next (by line number)")
    km({ "n", "v" }, "<LEADER>Bp", "<cmd>BookmarksGotoPrev<cr>", "[Bookmarks] Go to previous (by line number)")
    km({ "n", "v" }, "<LEADER>BN", "<cmd>BookmarksGotoNextInList<cr>", "[Bookmarks] Go to next (by id)")
    km({ "n", "v" }, "<LEADER>BP", "<cmd>BookmarksGotoPrevInList<cr>", "[Bookmarks] Go to previous (by id)")

    -- Tree view 
    km({ "n", "v" }, "<LEADER>BT", "<cmd>BookmarksTree<cr>", "[Bookmarks] Tree view")
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
    km({ "n", "v" }, "<LEADER>Bl<Cr>", "<cmd>BookmarksLists<cr>", "[Bookmarks] pick a List")
    km({ "n", "v" }, "<LEADER>Bln", "<cmd>BookmarksNewList<cr>", "[Bookmarks] create a New list")
    km({ "n", "v" }, "<LEADER>Blf", function() require("bookmarks.commands").current_file_bookmarks_to_new_list() end, "[Bookmarks] current File bookmarks to new list")

    km({ "n", "v" }, "<LEADER>BX", function() require("bookmarks.commands").mix_active_bookmark() end, "[Bookmarks] miX active bookmark into XML")
    -- km({ "n", "v" }, "<LEADER>BM", function() require("bookmarks.commands").mark_selected_files() end, "[Bookmarks] Mark selected files")

    -- Links
    km({ "n", "v" }, "<LEADER>BLl", function() require("bookmarks.commands")["Link bookmark"]() end, "[Bookmarks] Link bookmark")
    km({ "n", "v" }, "<LEADER>BLo", function() require("bookmarks.commands")["Goto linked out bookmarks"]() end, "[Bookmarks] goto Linked out bookmarks")
    km({ "n", "v" }, "<LEADER>BLi", function() require("bookmarks.commands")["Goto linked in bookmarks"]() end, "[Bookmarks] goto Linked in bookmarks")
    km({ "n", "v" }, "<LEADER>BLm", function() require("bookmarks.commands")["Mark and link to existing bookmark"]() end, "[Bookmarks] mark and link to existing bookmark")

    -- info
    km({ "n", "v" }, "<LEADER>BG", "<cmd>BookmarksGrep<cr>", "[Bookmarks] Grep through bookmarked files")
    km({ "n", "v" }, "<LEADER>Ba", "<cmd>BookmarksDesc<cr>", "[Bookmarks] add description")
    km({ "n", "v" }, "<LEADER>BI", "<cmd>BookmarksInfo<cr>", "[Bookmarks] plugin current Info")
    km({ "n", "v" }, "<LEADER>Bi", "<cmd>BookmarksInfoCurrentBookmark<cr>", "[Bookmarks] current bookmark Info")


  end,
}
