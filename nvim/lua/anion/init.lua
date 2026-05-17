require("anion.set")
require("anion.remap")
require("anion.lazy_init")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3 --tree
vim.g.netrw_winsize = 25


--TODO: LSP stuff. I want them moved to their own file for better structure
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true}
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) --show lsp references
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) --show lsp type definitions
--       vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--       vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set({ "n", "v" }, "<leader>vca", function() vim.lsp.buf.code_action() end, opts) --show available code actions
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)

--TODO: This is the native neovim way to do completion. maybe worth looking into it later
--        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
--        if client:supports_method('textDocument/completion') then
--            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
--            -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
--            -- client.server_capabilities.completionProvider.triggerCharacters = chars
--            vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
--        end

--TODO: look into these shortcuts and learn them as we go
--       vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--       vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--       vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--       vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    end
})



local severity = vim.diagnostic.severity
vim.diagnostic.config({
    virtual_text = {
        current_line = true,

    },
    -- update_in_insert = true,
    --    float = {
        --        focusable = false,
        --        style = "minimal",
        --        border = "rounded",
        --        source = "always",
        --        header = "",
        --        prefix = "",
        --    },
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

