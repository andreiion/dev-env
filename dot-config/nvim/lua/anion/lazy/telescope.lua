return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    --"BurntSushi/ripgrep", --required for live_grep and grep_string and is the first priority for find_files
    "sharkdp/fd",
    -- optional but recommended
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  config = function()
    local telescope = require("telescope")
    local themes = require("telescope.themes")

    --change ivy's own defaults by overriding the theme function
    local current_theme = "ivy"
    local original_get_ivy = themes.get_ivy
    themes.get_ivy = function(opts)
      opts = opts or {}
      opts.layout_config = vim.tbl_deep_extend("force", {
        height = 0.7,
        preview_width = 0.5,
      }, opts.layout_config or {})
      return original_get_ivy(opts)
    end

    telescope.setup({
      defaults = {
        dynamic_preview_title = true, --show path into grep preview
      },
      pickers = {
        find_files = { theme = current_theme },
        live_grep = { theme = current_theme },
        buffers = { theme = current_theme },
        oldfiles = { theme = current_theme },
        current_buffer_fuzzy_find = { theme = current_theme },
        git_files = { theme = current_theme },

        grep_string = { initial_mode = "normal", theme = current_theme },
        resume = { initial_mode = "normal", theme = current_theme },

        -- open lsp pickers in normal mode, no need for input when searching symbols
        lsp_document_symbols = { initial_mode = "normal" },
        lsp_type_definitions = { initial_mode = "normal" },
        lsp_references = { initial_mode = "normal", theme = current_theme },
        diagnostic = { initial_mode = "normal" },
      }
    })
    --TODO: look into "smart_history" and "ui-select" telescope plugins
    telescope.load_extension("fzf")


    local builtin = require("telescope.builtin")
    local keymap = vim.keymap
    keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files in Project" })
    keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "" })
    keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Grep Project" })
    keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
    keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Symbols" })
    keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
    keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
    keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume Telescope" })
    keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find str under cursor in cwd" })
    keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find, { desc = "Find in current buffer" })
    keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find in git files" })

    keymap.set("n", "<space>fsg", function()
      builtin.live_grep { cwd = vim.fn.stdpath("config") }
    end, { desc = "Find in neovim files" })
    keymap.set("n", "<space>fsf", function()
      builtin.find_files { cwd = vim.fn.stdpath("config") }
    end, { desc = "Find in neovim files" })
  end,
}
-- keymap.set("n", "<leader>fg", function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end) --project search
