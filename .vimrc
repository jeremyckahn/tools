syntax enable
set number
set hlsearch
set incsearch
set nocp
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
cnoreabbr nt NERDTree

let mapleader = ","

nmap <leader>vs :split<CR>
nmap <leader>sp :vsplit<CR>
nmap <leader>q :tabnew<CR>
nmap <leader>e :tabn<CR>
nmap <leader>w :tabp<CR>
nmap <leader>r :tabc<CR>
nmap <leader>n :NERDTree<CR>

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible