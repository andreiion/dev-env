return {
  'nvim-mini/mini.files',
  version = '*',

  config = function()
    require('mini.files').setup()

    local keymap = vim.keymap
    --keymap.set("n", "<leader>e", "<cmd> lua MiniFiles.open()<CR>" , { silent = true})
    keymap.set("n", "<leader>e",  function()
      --TODO: What happends if buf_name is empty?
      local buf_name = vim.api.nvim_buf_get_name(0)
      print("nvim_buf_get_name", buf_name)
      MiniFiles.open(buf_name)
    end)
  end
}
