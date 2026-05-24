local keymap = vim.keymap -- for conciseness
local lsp = vim.lsp

--TODO: Make this a for loop
lsp.config("ruff", require("anion.lsp.ruff"))
lsp.enable("ruff")
lsp.config("lua_ls", require("anion.lsp.lua_ls"))
lsp.enable("lua_ls")
lsp.config("pyrefly", require("anion.lsp.pyrefly"))
lsp.enable("pyrefly")
lsp.config("clangd", require("anion.lsp.clangd"))
lsp.enable("clangd")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    -- See `:help lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true}

    local builtin = require("telescope.builtin")
    keymap.set("n", "gd", lsp.buf.definition, opts)
    keymap.set("n", "gD", lsp.buf.declaration, opts)
    keymap.set("n", "gT", builtin.lsp_type_definitions, opts)
    keymap.set("n", "gr", builtin.lsp_references, opts)
    keymap.set("n", "K", lsp.buf.hover, opts)

    -- can set anchor_bias = "below" for signature help
    keymap.set("i", "<C-h>", lsp.buf.signature_help, opts)
    keymap.set("n", "<leader>vca", lsp.buf.code_action, opts)
    keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)

    --TODO: look into these shortcuts and learn them as we go
    -- keymap.set("n", "<leader>vrr", function() lsp.buf.references() end, opts)
    -- keymap.set("n", "<leader>vws", function() lsp.buf.workspace_symbol() end, opts)
    -- keymap.set("n", "<leader>vrn", function() lsp.buf.rename() end, opts)
  end
})

local severity = vim.diagnostic.severity
vim.diagnostic.config({
  virtual_text = {
    current_line = true,
  },
  update_in_insert = false,
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
})

vim.api.nvim_create_autocmd( 'FileType', {
  callback = function(ev)
    local ok = pcall(vim.treesitter.start, ev.buf)
    if not ok then
      return
    end
  end
})

-- remove the #ifdef greyout while keeping all navigation
vim.api.nvim_set_hl(0, "@lsp.type.comment.c", {})


