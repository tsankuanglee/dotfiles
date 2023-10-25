-- credit:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

local function augroup(name)
  return vim.api.nvim_create_augroup("my_" .. name, { clear = true })
end

-- for each opened buffer, switch working directory to that buffer's folder
-- autocmd BufEnter * silent! lcd %:p:h
--vim.api.nvim_create_autocmd({ "BufEnter" }, {
--  pattern = {"*"},
--  command = "silent! lcd %:p:h"
--})
-- use this instead
--  set autochdir           " Switch to current file's parent directory.

-- highlight on yank{{{
--vim.cmd([[
--au TextYankPost * silent! lua vim.highlight.on_yank()
--au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
--au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}
--]])
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})
-- }}} highlight on yank

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
