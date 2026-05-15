require("anion.set")
require("anion.remap")
require("anion.lazy_init")

vim.lsp.config("ruff", require("anion.lsp.ruff"))
vim.lsp.enable("ruff")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3 --tree
vim.g.netrw_winsize = 25
