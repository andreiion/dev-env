return {
  "nvim-mini/mini.nvim",
  version = "*",

  config = function()
    require("mini.files").setup()

    local keymap = vim.keymap
    keymap.set("n", "<leader>e", function()
      --TODO: What happends if buf_name is empty?
      local buf_name = vim.api.nvim_buf_get_name(0)
      MiniFiles.open(buf_name)
    end)
  end
}
