require("anion.set")
require("anion.remap")
require("anion.lazy_init")

vim.lsp.config("ruff", require("anion.lsp.ruff"))
vim.lsp.enable("ruff")
