--@type vim.lsp.Config
return {
  cmd = { "clangd",
          "--compile-commands-dir=build",
          "--background-index",
          "--header-insertion=never",
          "--path-mappings=/home/andio/repos/bp1=/workspaces/bp1"},
          -- "--log=verbose"},
  root_markers = { ".clangd", "compile_commands.json", ".git" },

  filetypes = { "c", "cpp" },
}
