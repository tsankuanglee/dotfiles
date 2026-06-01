return {
  setup = function()
    local Hydra = require("hydra")
    local cmd = require("hydra.keymap-util").cmd
    local builder = require("utils.hydra_builder")

    local buffer_col = {
      { key = "p", action = cmd("bprevious"), desc = "previous", exit = false },
      { key = "n", action = cmd("bnext"), desc = "next", exit = false },
    }

    local buffer_hydra = Hydra({
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
      if #vim.fn.getbufinfo({ buflisted = true }) > 1 then buffer_hydra:activate() end
    end

    vim.keymap.set("n", "gb", choose_buffer, { desc = "Choose buffer" })
  end,
}
