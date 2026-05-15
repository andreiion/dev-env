return {
    {
        "shaunsingh/nord.nvim",
        lazy = false,
        config = function()
            color = "nord"
            vim.g.nord_contrast = true
            vim.g.nord_italic = false
            vim.g.nord_uniform_diff_background = false
            vim.cmd.colorscheme(color)
        end
    --[[{
        "rose-pine/neovim",
        config = function()
            color = "rose-pine",
            vim.cmd.colorscheme(color)
        end
    }]]
    }
}
