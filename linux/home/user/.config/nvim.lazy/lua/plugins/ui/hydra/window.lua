local window_hint = [[
Window management (*=factory setting)

 *focus: -h--j--k--l-
 *move far: -H--J--K--L-
  move one: _<LEFT>__<DOWN>__<UP>__<RIGHT>_
   continuously: _<S-LEFT>__<S-DOWN>__<S-UP>__<S-RIGHT>_
 *resize one: -<-----+-->-
   continuously: _<C-h>__<C-j>__<C-k>__<C-l>_
 *-s-plit, -v-split, -o-nly, -c-lose, -=-equalize - maximize
]]

local setup = function()
  local Hydra = require("hydra")
  local cmd = require("hydra.keymap-util").cmd
  Hydra({
    name = "Window Management",
    hint = window_hint,
    config = {
      invoke_on_body = true,
      hint = {
        border = "rounded",
        offset = -1,
      },
      exit = true,
      -- nil: pass key and close; warn: warn and ignore; run: pass key and stay
      foreign_keys = nil,
      prepend_body_to_foreign_keys = true,
      --color = "pink",
    },
    mode = "n",
    body = "<C-w>",
    heads = {
--[[
      -- the defaults
      { "h", "<C-w>h", { exit = true } },
      { "j", "<C-w>j", { exit = true } },
      { "k", "<C-w>k", { exit = true } },
      { "l", "<C-w>l", { exit = true } },

      { "H", "<C-w>H", { exit = true } },
      { "J", "<C-w>J", { exit = true } },
      { "K", "<C-w>K", { exit = true } },
      { "L", "<C-w>L", { exit = true } },

      { "s", "<C-w>s", { exit = true } },
      { "v", "<C-w>v", { exit = true } },

      { "w", "<C-w>w", { exit = true, desc = false } },
      { "<C-w>", "<C-w>w", { exit = true, desc = false } },
      { "W", "<C-w>W", { exit = true, desc = false } },
      { "<C-S-w>", "<C-w>W", { exit = true, desc = false } },

      { "=", "<C-w>=", { exit = true, desc = "equalize" } },
      { "_", "<C-w>_", { exit = true, desc = false } },

      { "o", "<C-w>o", { exit = true, desc = "remain only" } },
      { "<C-o>", "<C-w>o", { exit = true, desc = false } },

      { "<", "<C-w><", { exit = true } },
      { "-", "<C-w>-", { exit = true } },
      { "+", "<C-w>+", { exit = true } },
      { ">", "<C-w>>", { exit = true } },
]]
      -- enhanced version
      -- move window
      { "<LEFT>", cmd("WinShift left"), { exit = true, desc = "move step left" } },
      { "<DOWN>", cmd("WinShift down"), { exit = true, desc = "move step down" } },
      { "<UP>", cmd("WinShift up"), { exit = true, desc = "move step up" } },
      { "<RIGHT>", cmd("WinShift right"), { exit = true, desc = "move step right" } },
      -- continuously
      { "<S-LEFT>", cmd("WinShift left"), { desc = "continuous move step left" } },
      { "<S-DOWN>", cmd("WinShift down"), { desc = "continuous move step down" } },
      { "<S-UP>", cmd("WinShift up"), { desc = "continuous move step up" } },
      { "<S-RIGHT>", cmd("WinShift right"), { desc = "continuous move step right" } },

      -- window resize
      { "<C-h>", "<C-w><" },
      { "<C-j>", "<C-w>-" },
      { "<C-k>", "<C-w>+" },
      { "<C-l>", "<C-w>>" },

      --[[ { "<C-s>", pcmd("split", "E36"), { exit = true, desc = false } },
      { "<C-v>", pcmd("vsplit", "E36"), { exit = true, desc = false } },

      { "c", pcmd("close", "E444"), { exit = true } },
      { "<C-c>", pcmd("close", "E444"), { exit = true, desc = false } },
      { "<C-q>", pcmd("close", "E444"), { exit = true, desc = false } }, ]]

      { "<Esc>", nil, { exit = true, desc = false } },
    },
  })
end
return {
  setup = setup,
}
