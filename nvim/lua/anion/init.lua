require("anion.set")
require("anion.remap")
require("anion.lazy_init")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3 --tree
vim.g.netrw_winsize = 25

local keymap = vim.keymap -- for conciseness

--TODO: LSP stuff. I want them moved to their own file for better structure
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true}

        local builtin = require("telescope.builtin")
        keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set("n", "gT", builtin.lsp_type_definitions, opts)
        keymap.set("n", "gr", builtin.lsp_references, opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)

--TODO: look into these shortcuts and learn them as we go
--       keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--       keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--       keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--       keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    end
})

local severity = vim.diagnostic.severity
vim.diagnostic.config({
    virtual_text = {
        current_line = true,
    },
        signs = {
            text = {
                [severity.ERROR] = " ",
                [severity.WARN] = " ",
                [severity.HINT] = "󰠠 ",
                [severity.INFO] = " ",
            },
        },
})

vim.lsp.config("ruff", require("anion.lsp.ruff"))
vim.lsp.enable("ruff")
vim.lsp.config("lua_ls", require("anion.lsp.lua_ls"))
vim.lsp.enable("lua_ls")
vim.lsp.config("pyrefly", require("anion.lsp.pyrefly"))
vim.lsp.enable("pyrefly")
vim.lsp.config("clangd", require("anion.lsp.clangd"))
vim.lsp.enable("clangd")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        keymap.set("n", "t", "<C-w><CR><C-w>T", { buffer = true, silent = true })
    end,
})
