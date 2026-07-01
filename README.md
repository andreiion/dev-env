# dev-env


For heavier remote editing, run Neovim as a server on the remote machine and connect from your local terminal. This keeps the editor close to the files, eliminating latency:
``` bash
#don't forget to install dependencies: ripgrep, fd
rsync -av ~/.config/nvim/ user@server:~/.config/nvim/

# On the remote server, start Neovim server headless
nvim --headless --listen /tmp/nvim.sock
# From your local machine, connect through SSH
ssh -L /tmp/remote-nvim.sock:/tmp/nvim.sock user@server
nvim --remote-ui --server /tmp/remote-nvim.sock
```

The --remote-ui flag sends only the UI protocol over the socket. All file I/O happens on the remote machine. This is faster than scp-based editing for large codebases and preserves the remote file system context (relative imports, project settings, virtual environments).

Sometimes there are issues with the server when stopping it with <C-c>


# Install neovim
``` bash
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
rm -rf nvim-linux-x86_64.tar.gz
```


# TODO list
- [ ] Highlight word under cursor in file
- [ ] Change colors dynamically in neovim
- [x] Add a file navigator - look for files in specific folder of project
- [ ] look for symbol and filter over specific files (any order)
- [ ] highlight/bold/color current searched word
- [ ] add DAP for C and python
- [ ] add autoformat for C and format on save (look at conform.nvim)
- [ ] add autoformat for Python
- [ ] integrate shellcheck and shfmt in neovim. Follow google shell style
- [ ] have a generic way to detect arch for neovim installation in setup script
    - something with: os="$(uname -s) arch="$(uname -m)"

