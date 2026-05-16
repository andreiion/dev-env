function ColorScheme(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "shaunsingh/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.nord_contrast = true
            vim.g.nord_italic = true
            vim.g.nord_uniform_diff_background = false
        end
    },
    {
        "rose-pine/neovim",
        lazy = false,
        priority = 1000,
        config = function()
            local color = "rose-pine-main"
--            local color = "rose-pine-moon"
            --            local color = "rose-pine-dawn"
            ColorScheme(color)
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                --transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                --    comments = { italic = false },
                --    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
            })
  --          local color = "tokyonight"
            --ColorScheme(color)
        end
    },
}
