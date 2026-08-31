local opt = vim.opt

opt.guicursor = "" -- similar to set cursorline
opt.termguicolors = true

opt.winborder = "rounded" --winborder for floating windows

opt.number = true
opt.relativenumber = true
opt.scrolloff = 8 -- context lines above and below the cursor

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true -- when expandtab is set => tab = x spaces
opt.smartindent = true

opt.preserveindent = true
opt.copyindent = true

opt.cursorline = true
opt.cursorlineopt = "number"

opt.formatoptions:remove "o" --don't let `o` add a comment
opt.iskeyword:append("-")    -- treat words separated by - as one word

opt.colorcolumn = "80"
opt.signcolumn = "yes" -- reserves signcolumn, so error icons can appear without pushing the buffer text sideways

opt.shada = {
  "'10", -- remember marks for last 10 files
  "<0",  -- disable register persistence
  "s10", -- skip registers larger than 10KB
  "h"    -- disabled restoring search highlight on startup
}

-- Mark tabs and spaces
--set list listchars=tab:»\ ,trail:·,extends:»,precedes:«
opt.list = true
opt.listchars = {
  tab = "» ",
  trail = "·",
  extends = "»",
  precedes = "«",
}

-- file settings
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true -- save undo history to an undo file
opt.updatetime = 50 -- save swap file after 50msec if nothing is typed

-- search settings
opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true
opt.ignorecase = true

--remove trailing whitespace from all file types
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})

-- clipboard
vim.g.clipboard = "osc52" -- use system clipboard as default register

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
