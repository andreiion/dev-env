return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        --'BurntSushi/ripgrep', --required for live_grep and grep_string and is the first priority for find_files
        'sharkdp/fd', --finder
        -- optional but recommended
        --{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    config = function()
        local builtin = require('telescope.builtin')
        local keymap = vim.keymap
        keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Grep Project" })
        keymap.set('n', '<leader>fg', builtin.live_grep, {desc = ""})
        keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Grep Project"})
        keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Help"})
        keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {desc = "Symbols"})
        keymap.set('n', '<leader>fd', builtin.diagnostics, {desc = "Diagnostics"})
        keymap.set('n', '<leader>fr', builtin.oldfiles, {desc = "Recent files"})
        keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
        keymap.set('n', '<C-p>', builtin.git_files, {})
       -- keymap.set('n', '<leader>fg', function()
       --     builtin.grep_string({ search = vim.fn.input("Grep > ") });
       -- end) --project search
    end,
}
