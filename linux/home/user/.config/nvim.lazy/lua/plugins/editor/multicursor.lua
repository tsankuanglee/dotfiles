-- https://github.com/jake-stewart/multicursor.nvim
--
return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set
    local km = require("utils").km -- keymap shortcut function

    -- local mc_mode = "off" -- values: off, set, edit
    -- km({"n", "x"}, "<LOCALLEADER>mc",
    --   function ()
    --     if mc_mode == "off" then
    --       mc_mode = "set"
    --     elseif mc_mode == "set" then
    --       mc_mode = "edit"
    --       mc.enableCursors()
    --     elseif mc_mode == "edit" then
    --       mc_mode = "off"
    --     end
    --   end,
    --   "[multicursor] toggle mode"
    -- )

    km({"n", "x"}, "<LOCALLEADER>mm", mc.toggleCursor, "[multicursor] toggle cursor")

    -- Add or skip cursor above/below the main cursor.
    km({"n", "x"}, "<s-up>", function()
      if mc.cursorsEnabled() then
        mc.lineAddCursor(-1)
      end
    end,
      "add cursor and move up"
    )
    km({"n", "x"}, "<s-down>", function()
      if mc.cursorsEnabled() then
        mc.lineAddCursor(1)
      end
    end,
      "add cursor and move down"
    )
    km({"n", "x"}, "<c-up>", function()
      if mc.cursorsEnabled() then
        mc.lineSkipCursor(-1)
      end
    end,
      "skip cursor and move up"
    )
    km({"n", "x"}, "<c-down>", function()
      if mc.cursorsEnabled() then
        mc.lineSkipCursor(1)
      end
    end,
      "skip cursor and move down"
    )
    -- Add or skip adding a new cursor by matching word/selection
    km({"n", "x"}, "<localleader>mn", function()
      if mc.cursorsEnabled() then
        mc.matchAddCursor(1)
      end
    end)
    km({"n", "x"}, "<localleader>ms", function()
      if mc.cursorsEnabled() then
        mc.matchSkipCursor(1)
      end
    end)
    km({"n", "x"}, "<localleader>mN", function()
      if mc.cursorsEnabled() then
        mc.matchAddCursor(-1)
      end
    end)
    km({"n", "x"}, "<localleader>mS", function()
      if mc.cursorsEnabled() then
        mc.matchSkipCursor(-1)
      end
    end
    )

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
