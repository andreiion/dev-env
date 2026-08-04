--@type vim.lsp.Config
return {
  cmd = { "lua-language-server" }, -- Command and arguments to start the server.
  filetypes = { "lua" },           -- Filetypes to automatically attach to.

  -- Sets the workspace "root" to the directory where any of these files is found.
  root_markers = { { ".emmyrc.json", ".luarc.json" }, ".git" },

  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    }
  }
}
