
vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
--When expandtab is set => tab = x spaces
vim.opt.expandtab = true

vim.opt.smartindent = true


vim.opt.swapfile = false


vim.opt.colorcolumn = "80"
-- Mark tabs and spaces
--set list listchars=tab:»\ ,trail:·,extends:»,precedes:«
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  extends = "»",
  precedes = "«",
}


--vim.api.nvim_create_autocmd("BufWritePre", {
--  pattern = "*",
--  command = [[%s/\s\+$//e]],
--})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})
