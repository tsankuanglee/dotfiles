-- nvim-telescope/telescope-fzf-native.nvim
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- FZF sorter for telescope
--
-- a c port of fzf. It only covers the algorithm and implements few functions to support calculating the score.
return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'make',
}

