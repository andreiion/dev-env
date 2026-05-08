call plug#begin()
" run the ':PlugInstall' command in vim
" List plugins here
Plug 'arcticicestudio/nord-vim'
Plug 'folke/tokyonight.nvim'
"Plug 'nvim-tree/nvim-tree.lua'
"Plug 'scrooloose/nerdtree'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""
""" Background Color Scheme and Higlight """"
"""""""""""""""""""""""""""""""""""""""""""""
"colorscheme nord
colorscheme tokyonight-night
set cursorline
highlight CursorLine term=bold cterm=bold

set colorcolumn=120
highlight ColorColumn  ctermbg=252
"""""""""""""""""""""""""""""""""""""""""""""
""" End Background Color Scheme and Higlight """"
"""""""""""""""""""""""""""""""""""""""""""""


set textwidth=0
" set encoding
set encoding=utf8

" Mark tabs and spaces
set list listchars=tab:»\ ,trail:·,extends:»,precedes:«

" Number of context lines you would like to see above and below the cursor.
set scrolloff=5

" Allow backspacing over everything in insert mode (taken from defaults.vim)
set backspace=indent,eol,start

set history=200               " keep 200 lines of command line history
set ruler                     " show the cursor position all the time
set showcmd                   " display incomplete commands
set wildmenu                  " display completion matches in a status line

set ttimeout                  " time out for key codes
set ttimeoutlen=100           " wait up to 100ms after Esc for special key

set autoindent
set smartindent
set hidden
set splitright
set splitbelow
set number                    " display line numbers
"set relativenumber            " display relative line numbers

set mouse=a                   " now we can use middle click to paste over SSH
set hlsearch                  " highlight all search matches

set termguicolors             " enable true color
"set term=screen-256color

"set path+=shared/**           " add all subdir from shared to path. Relative to current pwd

syntax on
filetype plugin indent on
set cinoptions=:0,l1,(0
syn on se title

" load manual pages
runtime ftplugin/man.vim

" Automatically remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e



""""""""""""""""""""""""""""
""" Vimrc quick commands """
""""""""""""""""""""""""""""

" Open vimrc
nnoremap <silent> <Leader>ev :<C-U>tab drop $MYVIMRC<CR>

" Reload vimrc
command! ReloadVimrc :source $MYVIMRC

""""""""""""""""""""""""""""
""" Vimrc quick commands """
""""""""""""""""""""""""""""




""""""""""""""""""""""""""""""
""" Coding Style Settings """"
""""""""""""""""""""""""""""""
" When expandtab is set => tab = x spaces
set expandtab

" 2 Spaces Coding Style
" set tabstop=2 softtabstop=2  shiftwidth=2 smarttab

" Personal weird Coding Style
set tabstop=4 softtabstop=0 shiftwidth=4 smarttab

" Linux Kernel Coding Style
"set tabstop=8 softtabstop=8 shiftwidth=8 smarttab
"""""""""""""""""""""""""""""""""
""" End Coding Style Settings """
"""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""
""" Mappings for a better life """
""""""""""""""""""""""""""""""""""
" Write buffer to file
nnoremap <silent> <Leader>w :<C-U>write<CR>


" Change between windows with Tab key
map <Tab> <C-W>w

" Reduce and increase the size of windows in split screen mode
map - <c-w><
map + <c-w>>

" Mapping for easy navigate in quickfix window (opened by cscope)
nnoremap <C-k> :cp<CR>
nnoremap <C-j> :cn<CR>

" Set <Leader>
"let g:mapleader = ' '

" Go to previous/next tab
nnoremap <Leader>j gT<CR>
nnoremap <Leader>k gt<CR>

" Keep the screen centered or not (toggle action)
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
""""""""""""""""""""""""""""""""""""""
""" End Mappings for a better life """
""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""
""" Vim Airlines Theme settings """
"""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.linenr = 'Ξ'
let g:airline_symbols.readonly = 'ro'
"""""""""""""""""""""""""""""""""""""""
""" End Vim Airlines Theme settings """
"""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""
""" Clang integration """
"""""""""""""""""""""""""
"let g:clang_format#code_style="llvm"
"let g:clang_format#auto_format = 0
"map <C-h> :ClangFormat <CR>
"""""""""""""""""""""""""""""
""" End Clang integration """
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""'"""
""" NERD Tree integration """
"""""""""""""""""""""""""""""
"nnoremap <Leader>n :NERDTree <CR>
"nnoremap <Leader>nc :NERDTreeClose <CR>
"""""""""""""""""""""""""""""
""" end NERD Tree integration """
"""""""""""""""""""""""""""""

" [Windows only] Use this to make cursor block pretty in the amazing WCL
" let &t_ti.="\e[1 q"
" let &t_SI.="\e[5 q"
" let &t_EI.="\e[1 q"
" let &t_te.="\e[0 q"
