--TODO: map a combo of ^W+<somethig> for vertical split
--TODO: I want to create a new tab functinality.
-- When running a command, I want to press <S-CR> to open the thing in a new tab
--TODO: Use https://neovim.io/doc/user/cmdline/ and CTRL-R {register}
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- word search and replace in file, case insensitive.
keymap.set("n", "<leader>s", [[:%s#\<<C-r><C-w>\>#<C-r><C-w>#gI<Left><Left><Left>]])
keymap.set("v", "<leader>s", [["sy:%s#<C-r>"#<C-r>"#gI<Left><Left><Left>]])

-- give exec rights directly from neovim
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Move up and down lines, in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- give exec rights directly from neovim
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Paste over selected section without losing the buffer
keymap.set("x", "<leader>p", [["_dP]])
-- use leader to copy to clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- stay centered when navigating and jumping symbols
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Quick fix navitgation. There are also default ones that seem better
--keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Terminal use directly from neovim
keymap.set("n", "<leader>t", ":tabnew | terminal<CR>I")
keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Tab controls
keymap.set("", "<leader><Tab>", ":tabnext<CR>")
keymap.set("", "<leader><S-Tab>", ":tabprevious<CR>")



