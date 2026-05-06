return {
    {
        "shaunsingh/nord.nvim",

        lazy = false,
        config = function()
            color = "nord"
            vim.cmd.colorscheme(color)
        end
    },
}
