local Hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd
local pcmd = require("hydra.keymap-util").pcmd

local window_hint = [[
^^^^^^^^^^^^     Move      ^^    Size   ^^   ^^     Split
^^^^^^^^^^^^-------------  ^^-----------^^   ^^---------------
^ ^ _k_ ^ ^  ^ ^ _K_ ^ ^   ^   _<C-k>_   ^   _s_: horizontally 
_h_ ^ ^ _l_  _H_ ^ ^ _L_   _<C-h>_ _<C-l>_   _v_: vertically
^ ^ _j_ ^ ^  ^ ^ _J_ ^ ^   ^   _<C-j>_   ^   _q_, _c_: close
focus^^^^^^  window^^^^^^  ^_=_: equalize^   _z_: maximize
^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^   ^^ ^          ^   _o_: remain only
_b_: choose buffer
   ]]

Hydra({
  name = "Windows",
  hint = window_hint,
  config = {
    invoke_on_body = true,
    hint = {
      border = "rounded",
      offset = -1,
    },
  },
  mode = "n",
  body = "<C-w>",
  heads = {
    { "h", "<C-w>h", { exit = true } },
    { "j", "<C-w>j", { exit = true } },
    { "k", "<C-w>k", { exit = true } },
    { "l", "<C-w>l", { exit = true } },

    { "H", cmd("WinShift left"), { exit = true } },
    { "J", cmd("WinShift down"), { exit = true } },
    { "K", cmd("WinShift up"), { exit = true } },
    { "L", cmd("WinShift right"), { exit = true } },

    -- window resize
    { "<C-h>", "<C-w><" },
    { "<C-l>", "<C-w>>" },
    { "<C-j>", "<C-w>-" },
    { "<C-k>", "<C-w>+" },
    { "=", "<C-w>=", { exit = true, desc = "equalize" } },

    { "s", pcmd("split", "E36"), { exit = true } },
    { "<C-s>", pcmd("split", "E36"), { exit = true, desc = false } },
    { "v", pcmd("vsplit", "E36"), { exit = true } },
    { "<C-v>", pcmd("vsplit", "E36"), { exit = true, desc = false } },

    { "w", "<C-w>w", { exit = true, desc = false } },
    { "<C-w>", "<C-w>w", { exit = true, desc = false } },

    { "z", cmd("WindowsMaximaze"), { exit = true, desc = "maximize" } },
    { "<C-z>", cmd("WindowsMaximaze"), { exit = true, desc = false } },

    { "o", "<C-w>o", { exit = true, desc = "remain only" } },
    { "<C-o>", "<C-w>o", { exit = true, desc = false } },

    { "b", choose_buffer, { exit = true, desc = "choose buffer" } },

    { "c", pcmd("close", "E444"), { exit = true } },
    { "q", pcmd("close", "E444"), { exit = true, desc = "close window" } },
    { "<C-c>", pcmd("close", "E444"), { exit = true, desc = false } },
    { "<C-q>", pcmd("close", "E444"), { exit = true, desc = false } },

    { "<Esc>", nil, { exit = true, desc = false } },
  },
})
