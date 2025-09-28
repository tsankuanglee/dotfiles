-- bookmarks
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
    local opts = {} -- check the "./lua/bookmarks/default-config.lua" file for all the options
    require("bookmarks").setup(opts) -- you must call setup to init sqlite db

    local km = require("utils").km -- keymap shortcut function

    km({ "n", "v" }, "m<Space>", "<cmd>BookmarksMark<cr>", "Mark current line into active BookmarkList.")
    km({ "n", "v" }, "m;", "<cmd>BookmarksGoto<cr>", "Go to bookmark at current active BookmarkList")
    km({ "n", "v" }, "m<Bslash>", "<cmd>BookmarksCommands<cr>", "Find and trigger a bookmark command.")

    km({ "n", "v" }, "Bd", function() require("bookmarks.commands").delete_mark_of_current_file() end, "Booksmark Clear Line")
    -- or create your custom commands
    -- vim.api.nvim_create_user_command("BookmarksClearCurrentFile", function() require("bookmarks.commands").delete_mark_of_current_file() end, {})


  end,
}
