syntax enable
set number
set hlsearch
set incsearch
set nocp
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
cnoreabbr nt NERDTree
call pathogen#infect('~/tools/vim/bundle')

let mapleader = ","

nmap <leader>vs :split<CR>
nmap <leader>sp :vsplit<CR>
nmap <leader>q :tabnew<CR>
nmap <leader>e :tabn<CR>
nmap <leader>w :tabp<CR>
nmap <leader>r :tabc<CR>
nmap <leader>n :NERDTree<CR>
nmap <leader>a :set autoindent<CR>
nmap <leader>s :set noautoindent<CR>
nmap <leader>d :set wrap<CR>
nmap <leader>f :set nowrap<CR>

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

if has('mouse')
  set mouse=a
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" This `let` is needed for closetag.vim.  It is.  Don't move it.
let g:closetag_html_style=1
source ~/tools/vim/bundle/closetag.vim
