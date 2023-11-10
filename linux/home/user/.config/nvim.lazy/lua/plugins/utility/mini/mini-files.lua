-- mini-files is a file explorer that featrues MacOS-column-view-like representation,
-- and direct filelist buffer editing capability.
local custom_setup = function()
  local MiniFiles = require("mini.files")
  MiniFiles.setup({
    -- Customization of shown content
    content = {
      -- Predicate for which file system entries to show
      filter = nil,
      -- What prefix to show to the left of file system entry
      prefix = nil,
      -- In which order to show file system entries
      sort = nil,
    },

    -- Module mappings created only inside explorer.
    -- Use `''` (empty string) to not create one.
    mappings = {
      close = "q",
      go_in = "<TAB>",
      go_in_plus = "<CR>",
      go_out = "<S-TAB>",
      go_out_plus = "-",
      reset = "<BS>",
      reveal_cwd = "@",
      show_help = "g?",
      synchronize = "=",
      trim_left = "<",
      trim_right = ">",
    },

    -- General options
    options = {
      -- Whether to delete permanently or move into module-specific trash
      permanent_delete = true,
      -- Whether to use for editing directories
      use_as_default_explorer = false,
    },

    -- Customization of explorer windows
    windows = {
      -- Maximum number of windows to show side by side
      max_number = math.huge,
      -- Whether to show preview of file/directory under cursor
      preview = true,
      -- Width of focused window
      width_focus = 50,
      -- Width of non-focused window
      width_nofocus = 15,
      -- Width of preview window
      width_preview = 40,
    },
  })
  local km = require("utils").km -- keymap shortcut function
  km("n", "<LEADER><LEADER>", function() MiniFiles.open() end, "mini.files")

  -- Create mapping to set current working directory ~
  local files_set_cwd = function(_)
    -- Works only if cursor is on the valid file system entry
    local cur_entry_path = MiniFiles.get_fs_entry().path
    local cur_directory = vim.fs.dirname(cur_entry_path)
    vim.fn.chdir(cur_directory)
  end
  vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesBufferCreate",
    callback = function(args) km("n", "g@", files_set_cwd, "mini.files set cwd", { buffer = args.data.buf_id }) end,
  })
end

return {
  custom_setup = custom_setup
}
