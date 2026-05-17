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

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) --project find
        vim.keymap.set('n', '<C-p>', builtin.git_files, {}) --project git search
        vim.keymap.set('n', '<leader>F', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end) --project search

    end
}
