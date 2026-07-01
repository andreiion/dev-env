return {
  "esmuellert/codediff.nvim",
  config = function()
    local codediff = require("codediff")
    codediff.setup({
      explorer = {
        position = "bottom",
        width = 30,
        height = 10,
      }
    })
  end
}
