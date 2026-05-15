return {
    "NeogitOrg/neogit",
--    lazy = true,
    dependencies = {
        "esmuellert/codediff.nvim",      -- optional

        "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
        local neogit = require("neogit")
        neogit.setup({})
        vim.keymap.set("n", "<leader>gs", function() neogit.open({ kind = "split" }) end)
    end
}

