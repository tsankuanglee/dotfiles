-- This plugin adds highlights for text filetypes, like markdown, orgmode, and neorg.
return {
  'lukas-reineke/headlines.nvim',
  dependencies = "nvim-treesitter/nvim-treesitter",
  lazy=false,
  enable=true,
  config = function()
    vim.cmd [[highlight markdownH1 guibg=#1e2718]]
    vim.cmd [[highlight markdownH2 guibg=#21262d]]
    vim.cmd [[highlight MarkdownCode guibg=#1c1c1c]]

    vim.cmd [[highlight Headline1 guibg=#1e2718]]
    vim.cmd [[highlight Headline2 guibg=#21262d]]
    vim.cmd [[highlight CodeBlock guibg=#1c1c1c]]
    vim.cmd [[highlight Dash guibg=#D19A66 gui=bold]]

    require("headlines").setup({
      markdown = {
        headline_highlights = { "markdownH1", "markdownH2" },
      },
      org = {
        headline_highlights = { "Headline1", "Headline2" },
      }
    })
  end
}
