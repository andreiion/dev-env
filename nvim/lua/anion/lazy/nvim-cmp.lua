return {
    'saghen/blink.cmp',
    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
        require("blink.cmp").setup({
            keymap = {
                preset = "default",
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<C-n>"] = { "select_next", "fallback" },
                ["<C-y>"] = { "accept", "fallback" },
                ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
            },
            completion = {
                documentation = { auto_show = true },
                accept = {
                    auto_brackets = { enabled = false },
                },
            },
            signature = {
                enabled = true,
            },
        })
    end,

}
