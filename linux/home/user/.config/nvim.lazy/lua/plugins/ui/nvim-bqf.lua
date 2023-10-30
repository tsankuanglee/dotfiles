return {
  'kevinhwang91/nvim-bqf',
  ft = 'qf',
  dependencies = {
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  },
  config = function()
    local bqf = require("bqf")

    bqf.setup({
      auto_resize_height = true,
      filter = {
        fzf = {
          action_for = {
            ['ctrl-t'] = {
              description = [[Press ctrl-t to open up the item in a new tab]],
              default = 'tabedit'
            },
            ['ctrl-v'] = {
              description = [[Press ctrl-v to open up the item in a new vertical split]],
              default = 'vsplit'
            },
            ['ctrl-x'] = {
              description = [[Press ctrl-x to open up the item in a new horizontal split]],
              default = 'split'
            },
            ['ctrl-q'] = {
              description = [[Press ctrl-q to toggle sign for the selected items]],
              default = 'signtoggle'
            },
            ['ctrl-c'] = {
              description = [[Press ctrl-c to close quickfix window and abort fzf]],
              default = 'closeall'
            }
          },
          extra_opts = {
            description = 'Extra options for fzf',
            default = {'--bind', 'ctrl-o:toggle-all', '--delimiter', '|'}
          }
        }
      },
      func_map = {
      }
    })
  end,


}
