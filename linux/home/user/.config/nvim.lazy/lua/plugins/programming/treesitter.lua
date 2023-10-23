-- system dependencies: tree-sitter-cli
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  priority = 500, -- to load before many other plugins that depend on treesitter
  config = function()
    local configs = require("nvim-treesitter.configs")
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    configs.setup({
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        --"java",
        "html",
        "javascript",
        "python",
        "rust",
        "typescript",
        "vim",
        "vimdoc",
        --"query"
      },
      sync_install = false,
      ignore_install = { "" }, -- List of parsers to ignore installing
      highlight = {
        enable = true,         -- false will disable the whole extension
        disable = { "" },      -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true, disable = { "yaml" } },
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      }
    })
  end
}
-- vim: ft=lua foldmethod=marker sw=2 ts=2 sts=2 et
