function ColorScheme(color)
    color = color or "rose-pine-moon"
    print("setting color", color)
    vim.cmd.colorscheme(color)

end

return {
    {
        "shaunsingh/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            --vim.g.nord_contrast = true
            --vim.g.nord_italic = true
            --vim.g.nord_uniform_diff_background = false
        end
    },
    {
        "rose-pine/neovim",
        lazy = false,
        priority = 1000,
        config = function()
            --local color = "rose-pine-main"
            local color = "rose-pine-moon"
            --local color = "rose-pine-dawn"
            ColorScheme(color)
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        config = function()
            require("tokyonight").setup({
                style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
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
