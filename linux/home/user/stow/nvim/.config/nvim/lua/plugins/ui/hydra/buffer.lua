local M = {}
M.setup = function()
    local Hydra = require("hydra")
    local cmd = require("hydra.keymap-util").cmd
    local builder = require("plugins.ui.hydra.hydra-builder")

    local buffer_col = {
      { key = "p", action = cmd("bprevious"), desc = "previous", exit = false },
      { key = "n", action = cmd("bnext"), desc = "next", exit = false },
    }

    M.hydra = Hydra({
      name = "buffer_hydra",
      hint = builder.generate_hint("Buffer Management", { buffer_col }),
      config = {
        on_key = function()
          -- Preserve animation
          vim.wait(200, function() vim.cmd("redraw") end, 30, false)
        end,
      },
      heads = builder.generate_heads({ buffer_col }),
    })

    local function choose_buffer()
      if #vim.fn.getbufinfo({ buflisted = true }) > 1 then M.hydra:activate() end
    end

    vim.keymap.set("n", "gb", choose_buffer, { desc = "Choose buffer" })
  end

M.activate = function()
  if M.hydra then M.hydra:activate() end
end

return M
