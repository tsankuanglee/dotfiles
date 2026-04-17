-- hex editor
--   require 'hex'.dump()      -- switch to hex view
--   require 'hex'.assemble()  -- go back to normal view
--   require 'hex'.toggle()    -- switch back and forth
-- or their vim cmds:
--   :HexDump
--   :HexAssemble
--   :HexToggle
-- any file opens in hex view if opened with -b:
--   nvim -b file
--   nvim -b file1 file2
return {
  "RaafatTurki/hex.nvim",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require 'hex'.setup {

      -- cli command used to dump hex data
      dump_cmd = 'xxd -g 1 -u',

      -- cli command used to assemble from hex data
      assemble_cmd = 'xxd -r',

      -- function that runs on BufReadPre to determine if it's binary or not
      is_file_binary_pre_read = function()
        -- logic that determines if a buffer contains binary data or not
        -- must return a bool
      end,

      -- function that runs on BufReadPost to determine if it's binary or not
      is_file_binary_post_read = function()
        -- logic that determines if a buffer contains binary data or not
        -- must return a bool
      end,
    }
    local km = require("utils").km -- keymap shortcut function
    km({ "n", "v" }, "<Space>xd", "<cmd>HexDump<cr>", "[hex] dump")
    km({ "n", "v" }, "<Space>xa", "<cmd>HexAssemble<cr>", "[hex] assemble")
    km({ "n", "v" }, "<Space>xx", "<cmd>HexToggle<cr>", "[hex] toggle")
  end,
}

