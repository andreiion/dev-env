vim.opt.guicursor = "" -- similar to set cursorline

vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- when expandtab is set => tab = x spaces
vim.opt.smartindent = true
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes" -- reserves signcolumn, so error icons can appear without pushing the buffer text sideways

-- Mark tabs and spaces
--set list listchars=tab:»\ ,trail:·,extends:»,precedes:«
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  extends = "»",
  precedes = "«",
}

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true -- save undo history to an undo file

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50 -- save swap file after 50msec if nothing is typed


vim.opt.scrolloff = 8 -- context lines above and below the cursor

--remove trailing whitespace from all file types
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})

vim.opt.winborder = "rounded" --default winborder for all floating windows

-- clipboard
vim.g.clipboard = "osc52" -- use system clipboard as default register
vim.opt.clipboard:append("unnamedplus")

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
