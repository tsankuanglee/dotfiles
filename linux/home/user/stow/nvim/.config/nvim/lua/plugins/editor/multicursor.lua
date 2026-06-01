-- jake-stewart/multicursor.nvim
-- https://github.com/jake-stewart/multicursor.nvim
-- Multiple cursors for Neovim
return {
  keys = {
    --     { "<LOCALLEADER>mc", --   function ()
    --     if mc_mode == "off" then
    --       mc_mode = "set"
    --     elseif mc_mode == "set" then
    --       mc_mode = "edit"
    --       require("multicursor-nvim").enableCursors()
    --     elseif mc_mode == "edit" then
    --       mc_mode = "off"
    --     end
    --   end, mode = {"n", "x"}, desc = --   "[multicursor] toggle mode"
    -- },
    { "<LOCALLEADER>mm", function() require("multicursor-nvim").toggleCursor() end, mode = {"n", "x"}, desc = "[multicursor] toggle cursor" },
    { "<s-up>", function()
        if require("multicursor-nvim").cursorsEnabled() then
          require("multicursor-nvim").lineAddCursor(-1)
        end
      end, mode = {"n", "x"}, desc = "[multicursor] add cursor and move up" },
    { "<s-down>", function()
      if require("multicursor-nvim").cursorsEnabled() then
        require("multicursor-nvim").lineAddCursor(1)
      end
    end, mode = {"n", "x"}, desc = "[multicursor] add cursor and move down" },
    { "<c-up>", function()
      if require("multicursor-nvim").cursorsEnabled() then
        require("multicursor-nvim").lineSkipCursor(-1)
      end
    end, mode = {"n", "x"}, desc = "[multicursor] skip cursor and move up" },
    { "<c-down>", function()
        if require("multicursor-nvim").cursorsEnabled() then
          require("multicursor-nvim").lineSkipCursor(1)
        end
      end, mode = {"n", "x"}, desc = "[multicursor] skip cursor and move down" },
    { "<localleader>mn", function()
        if require("multicursor-nvim").cursorsEnabled() then
          require("multicursor-nvim").matchAddCursor(1)
        end
      end, mode = {"n", "x"}, desc = "[multicursor] match add cursor" },
    { "<localleader>ms", function()
        if require("multicursor-nvim").cursorsEnabled() then
          require("multicursor-nvim").matchSkipCursor(1)
        end
      end, mode = {"n", "x"}, desc = "[multicursor] match skipcursor" },
    { "<localleader>mN", function()
        if require("multicursor-nvim").cursorsEnabled() then
          require("multicursor-nvim").matchAddCursor(-1)
        end
      end, mode = {"n", "x"}, desc = "[multicursor] match back add cursor" },
    { "<localleader>mS", function()
        if require("multicursor-nvim").cursorsEnabled() then
          require("multicursor-nvim").matchSkipCursor(-1)
        end
      end, mode = {"n", "x"}, desc = "[multicursor] match back skip cursor" },
  },
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set

    -- local mc_mode = "off" -- values: off, set, edit


    -- Add or skip cursor above/below the main cursor.
    -- Add or skip adding a new cursor by matching word/selection

    -- Add and remove cursors with control + left click.
    set("n", "<c-leftmouse>", mc.handleMouse)
    set("n", "<c-leftdrag>", mc.handleMouseDrag)
    set("n", "<c-leftrelease>", mc.handleMouseRelease)

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)

      -- Select a different cursor as the main one.
      layerSet({"n", "x"}, "<s-tab>", mc.prevCursor)
      layerSet({"n", "x"}, "<tab>", mc.nextCursor)

      -- Delete the main cursor.
      layerSet({"n", "x"}, "<s-del>", mc.deleteCursor)

      -- Enable and clear cursors using escape.
      layerSet("n", "<esc>", function()
        if mc.cursorsEnabled() then
          mc.clearCursors()
        else
          mc.enableCursors()
        end
      end)
    end)

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { reverse = true })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn"})
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { reverse = true })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
  end
}
