--@type vim.lsp.Config
return {
  cmd = { "clangd",
    "--compile-commands-dir=build",
    "--background-index",
    "--header-insertion=never",
    --don't forget to create a symbolic link for /home/ascom/bp1
    "--path-mappings=/home/andio/repos/bp1=/home/ascom/bp1" },
  -- "--log=verbose"},
  root_markers = { ".clangd", "compile_commands.json", ".git" },

  filetypes = { "c", "cpp" },
}
