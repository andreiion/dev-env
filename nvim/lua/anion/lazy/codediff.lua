return {
    "esmuellert/codediff.nvim",
    config = function()
        local codediff = require("codediff")
        codediff.setup({
            explorer = {
                width = 30,
            }
        })
    end
}
