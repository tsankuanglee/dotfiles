return {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_markdown_css = "/Users/tlee/.markdown.css"
        vim.g.mkdp_preview_options = {
            mkit = {},
            katex = {},
            uml = {},
            maid = {},
            disable_sync_scroll = 0,
            sync_scroll_type = 'middle',
            hide_yaml_meta = 1,
            sequence_diagrams = { theme = 'simple' },
            flowchart_diagrams = {},
            content_editable = false,
            disable_filename = 0,
            toc = {},
        }
    end,
}
