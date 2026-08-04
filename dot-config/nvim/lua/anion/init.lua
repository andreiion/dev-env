require("anion.set")
require("anion.remap")
require("anion.lazy_init")
require("anion.lsp")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3 --tree
vim.g.netrw_winsize = 25

local keymap = vim.keymap
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    keymap.set("n", "t", "<C-w><CR><C-w>T", { buffer = true, silent = true })
  end,
})
