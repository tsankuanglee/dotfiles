-- system dependencies: tree-sitter-cli
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  priority = 500, -- to load before many other plugins that depend on treesitter
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = {
        "bash",
        "cpp",
        "c",      -- should always be installed
        "css",
        "csv",
        "diff",
        "fish",
        "gitcommit",
        "gitignore",
        "go",
        "html",
        "java",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "kotlin",
        "lua",    -- should always be installed
        "make",
        "markdown",
        "markdown_inline",
        "perl",
        "php",
        "python",
        "query",  -- should always be installed
        "regex",
        "ruby",
        "rust",
        "scss",
        "sql",
        "toml",
        "tsv",
        "typescript",
        "vimdoc", -- should always be installed
        "vim",    -- should always be installed
        "vue",
        "xml",
        "yaml",
        "zig",
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
      -- List of parsers to ignore installing
      ignore_install = { "" },

      -- available modules
      highlight = {    -- Consistent syntax highlighting.
        enable = true, -- false will disable the whole extension
        disable = {},  -- list of language that will be disabled
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,
      },
      incremental_selection = { -- Incremental selection based on the named nodes from the grammar.
        enable = true,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          -- the following ones are only effective when there's a selection
          node_incremental = "grn",
          node_decremental = "grm",
          scope_incremental = "grc",
        },
      },
      indent = { -- Indentation based on treesitter for the = operator. NOTE: This is an experimental feature.
        enable = true,
        disable = { "yaml" },
      },

      -- external modules
      matchup = { -- vim.matchup integration
        enable = true,
        -- disable = {},  -- optional, list of language that will be disabled

        -- do not use virtual text to highlight the virtual end of a block,
        -- for languages without explicit end markers (e.g., Python).
        -- disable_virtual_text = false,

        -- additionally include traditional vim regex matches for symbols.
        -- For example, highlights /* */ comments in C++ which are not supported in tree-sitter matching.
        include_match_words = true,
      },

    })

    -- # folding: see nvim-ufo.lua, which is faster
    -- vim.opt.foldmethod = "expr"
    -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    -- vim.opt.foldenable = false
  end,
}
