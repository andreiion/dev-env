--TODO: map a combo of ^W+<somethig> for vertial split
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>pv", vim.cmd.Ex)

--word search and replace in file, case insensitive. visu
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("v", "<leader>s", [[y:%s/<C-r>"/<C-r>"/gI<Left><Left><Left>]])

keymap.set("x", "<leader>p", [["_dP]])
-- Move up and down lines, in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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
